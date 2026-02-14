'use client';

import { useState, useCallback, useRef } from 'react';

export default function ImageUploader({ onImageSelected, disabled }) {
    const [preview, setPreview] = useState(null);
    const [dragActive, setDragActive] = useState(false);
    const [fileName, setFileName] = useState('');
    const [error, setError] = useState(null);
    const fileInputRef = useRef(null);

    const processFile = useCallback((file) => {
        setError(null);
        if (!file) return;

        // Validate type
        if (!file.type.startsWith('image/')) {
            setError('Please upload an image file (JPEG, PNG, WebP)');
            if (fileInputRef.current) fileInputRef.current.value = '';
            return;
        }

        // Validate size (10MB max)
        if (file.size > 10 * 1024 * 1024) {
            setError('Image must be under 10MB');
            if (fileInputRef.current) fileInputRef.current.value = '';
            return;
        }

        setFileName(file.name);

        // Create an object URL for instant preview (better performance than base64)
        const objectUrl = URL.createObjectURL(file);
        setPreview(objectUrl);

        const reader = new FileReader();
        reader.onload = (e) => {
            const dataUrl = e.target.result;

            // Extract base64 and mime type
            const base64 = dataUrl.split(',')[1];
            const mimeType = file.type;

            // Pass objectUrl as dataUrl to keep DOM lightweight
            onImageSelected({ base64, mimeType, dataUrl: objectUrl });
        };
        reader.readAsDataURL(file);
    }, [onImageSelected]);

    const handleDrop = useCallback((e) => {
        e.preventDefault();
        setDragActive(false);
        const file = e.dataTransfer.files[0];
        processFile(file);
    }, [processFile]);

    const handleDragOver = useCallback((e) => {
        e.preventDefault();
        setDragActive(true);
        setError(null);
    }, []);

    const handleDragLeave = useCallback((e) => {
        e.preventDefault();
        setDragActive(false);
    }, []);

    const handleChange = useCallback((e) => {
        const file = e.target.files[0];
        processFile(file);
    }, [processFile]);

    const handleClick = () => {
        if (!disabled) {
            setError(null);
            fileInputRef.current?.click();
        }
    };

    const handleKeyDown = (e) => {
        if (disabled || preview) return;
        if (e.key === 'Enter' || e.key === ' ') {
            e.preventDefault();
            setError(null);
            fileInputRef.current?.click();
        }
    };

    const handleRemove = (e) => {
        e.stopPropagation();
        setPreview(null);
        setFileName('');
        setError(null);
        onImageSelected(null);
        if (fileInputRef.current) fileInputRef.current.value = '';
    };

    return (
        <div
            className={`upload-zone ${dragActive ? 'drag-active' : ''} ${preview ? 'has-preview' : ''} ${disabled ? 'disabled' : ''}`}
            onDrop={handleDrop}
            onDragOver={handleDragOver}
            onDragLeave={handleDragLeave}
            onClick={handleClick}
            onKeyDown={handleKeyDown}
            role={!preview ? "button" : undefined}
            tabIndex={disabled || preview ? -1 : 0}
            aria-label={!preview ? "Upload room photo" : undefined}
            aria-disabled={disabled}
        >
            <input
                ref={fileInputRef}
                type="file"
                accept="image/*"
                onChange={handleChange}
                style={{ display: 'none' }}
                disabled={disabled}
            />

            {preview ? (
                <div className="preview-container">
                    <img src={preview} alt="Room preview" className="preview-image" />
                    <div className="preview-overlay">
                        <span className="file-name">{fileName}</span>
                        <button className="remove-btn" onClick={handleRemove} disabled={disabled}>
                            ✕ Remove
                        </button>
                    </div>
                </div>
            ) : (
                <div className="upload-placeholder">
                    {error && (
                        <div
                            role="alert"
                            style={{
                                color: 'var(--accent-red)',
                                marginBottom: '16px',
                                padding: '8px 12px',
                                background: 'rgba(231, 76, 60, 0.1)',
                                borderRadius: 'var(--radius-sm)',
                                border: '1px solid rgba(231, 76, 60, 0.3)',
                                fontSize: '14px',
                                fontWeight: 500,
                                display: 'flex',
                                alignItems: 'center',
                                gap: '8px',
                                maxWidth: '100%'
                            }}
                        >
                            <span style={{ fontSize: '16px' }}>⚠️</span> {error}
                        </div>
                    )}
                    <div className="upload-icon">
                        <svg width="64" height="64" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="1.5">
                            <path d="M21 15v4a2 2 0 01-2 2H5a2 2 0 01-2-2v-4M17 8l-5-5-5 5M12 3v12" />
                        </svg>
                    </div>
                    <h3>Drop your room photo here</h3>
                    <p>or click to browse • JPEG, PNG, WebP • Max 10MB</p>
                </div>
            )}
        </div>
    );
}
