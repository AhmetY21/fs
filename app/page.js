'use client';

import { useState, useCallback, useEffect } from 'react';
import ImageUploader from '@/components/ImageUploader';
import SpatialOverlay from '@/components/SpatialOverlay';
import FengShuiReport from '@/components/FengShuiReport';

export default function Home() {
  const [imageData, setImageData] = useState(null);
  const [analysis, setAnalysis] = useState(null);
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState(null);
  const [step, setStep] = useState('upload'); // upload | analyzing | result

  const handleImageSelected = useCallback((data) => {
    setImageData(data);
    setAnalysis(null);
    setError(null);
    setStep('upload');
  }, []);

  // Cleanup object URL when imageData changes or component unmounts
  useEffect(() => {
    return () => {
      if (imageData?.dataUrl?.startsWith('blob:')) {
        URL.revokeObjectURL(imageData.dataUrl);
      }
    };
  }, [imageData]);

  const handleAnalyze = async () => {
    if (!imageData) return;

    setLoading(true);
    setError(null);
    setStep('analyzing');

    try {
      // Convert file to base64 only when needed for analysis
      // This prevents holding large base64 strings in memory during the preview phase
      const base64 = await new Promise((resolve, reject) => {
        const reader = new FileReader();
        reader.onload = (e) => resolve(e.target.result.split(',')[1]);
        reader.onerror = reject;
        reader.readAsDataURL(imageData.file);
      });

      const res = await fetch('/api/analyze', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({
          imageBase64: base64,
          mimeType: imageData.mimeType
        })
      });

      const data = await res.json();

      if (!res.ok) {
        throw new Error(data.error || 'Analysis failed');
      }

      setAnalysis(data.analysis);
      setStep('result');
    } catch (err) {
      setError(err.message);
      setStep('upload');
    } finally {
      setLoading(false);
    }
  };

  const handleReset = () => {
    setImageData(null);
    setAnalysis(null);
    setError(null);
    setStep('upload');
  };

  return (
    <main className="app-container">
      {/* Progress Steps */}
      <div className="steps-row">
        <div className="steps-bar">
          <div className={`step ${step === 'upload' ? 'active' : ''} ${analysis ? 'done' : ''}`}>
            <span className="step-num">1</span>
            <span className="step-label">Upload</span>
          </div>
          <div className="step-divider" />
          <div className={`step ${step === 'analyzing' ? 'active' : ''} ${analysis ? 'done' : ''}`}>
            <span className="step-num">2</span>
            <span className="step-label">Analyze</span>
          </div>
          <div className="step-divider" />
          <div className={`step ${step === 'result' ? 'active' : ''}`}>
            <span className="step-num">3</span>
            <span className="step-label">Report</span>
          </div>
        </div>
        {step === 'result' && (
          <button className="btn btn-ghost" onClick={handleReset}>← New Analysis</button>
        )}
      </div>

      {/* Error Display */}
      {error && (
        <div className="error-banner">
          <span>⚠️ {error}</span>
          <button onClick={() => setError(null)}>✕</button>
        </div>
      )}

      {/* Upload Step */}
      {(step === 'upload' || step === 'analyzing') && (
        <section className="section upload-section">
          <div className="section-header">
            <h2>Upload Your Room Photo</h2>
            <p>Take a clear photo of your room showing the door position, main furniture, and windows.</p>
          </div>

          <ImageUploader onImageSelected={handleImageSelected} disabled={loading} />

          {imageData && (
            <div className="action-bar">
              <button
                className="btn btn-primary btn-lg"
                onClick={handleAnalyze}
                disabled={loading}
              >
                {loading ? (
                  <>
                    <span className="spinner" />
                    Analyzing with Feng Shui AI...
                  </>
                ) : (
                  <>☯ Analyze Feng Shui</>
                )}
              </button>
            </div>
          )}
        </section>
      )}

      {/* Results Step */}
      {step === 'result' && analysis && (
        <section className="section results-section">
          <div className="results-grid">
            {/* Left: Spatial Map */}
            <div className="results-left">
              <div className="panel">
                <h3 className="panel-title">🗺️ Spatial Map</h3>
                <SpatialOverlay
                  imageUrl={imageData.dataUrl}
                  elements={analysis.elements}
                  commandPosition={analysis.command_position}
                />
              </div>
            </div>

            {/* Right: Report */}
            <div className="results-right">
              <div className="panel">
                <h3 className="panel-title">📋 Feng Shui Report</h3>
                <FengShuiReport analysis={analysis} />
              </div>
            </div>
          </div>

          {/* Redesign Prompt Preview */}
          {analysis.redesign_prompt && (
            <div className="panel redesign-prompt-panel">
              <h3 className="panel-title">🎨 AI Redesign Prompt</h3>
              <p className="prompt-preview">{analysis.redesign_prompt}</p>
              <div className="prompt-actions">
                <button
                  className="btn btn-secondary"
                  onClick={() => navigator.clipboard.writeText(analysis.redesign_prompt)}
                >
                  📋 Copy Prompt
                </button>
                <span className="prompt-note">
                  This prompt can be used with ControlNet for AI room redesign (coming soon)
                </span>
              </div>
            </div>
          )}
        </section>
      )}

      {/* Footer */}
      <footer className="app-footer">
        <p>Powered by Gemini Vision AI • Feng Shui knowledge base with {35}+ verified rules</p>
      </footer>
    </main>
  );
}
