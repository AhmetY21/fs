'use client';

import { getScoreGrade } from '@/lib/score-calculator';

const SEVERITY_LABELS = {
    5: 'Critical',
    4: 'High',
    3: 'Moderate',
    2: 'Low',
    1: 'Minor'
};

export default function FengShuiReport({ analysis }) {
    if (!analysis) return null;

    const { grade, color, label } = getScoreGrade(analysis.overall_score);

    return (
        <div className="fengshui-report">
            {/* Score Section */}
            <div className="score-section">
                <div className="score-circle" style={{ borderColor: color }}>
                    <span className="score-number" style={{ color }}>{analysis.overall_score}</span>
                    <span className="score-label">{label}</span>
                    <span className="score-grade" style={{ color }}>{grade}</span>
                </div>
                <div className="score-details">
                    <div className="detail-item">
                        <span className="detail-label">Room Type</span>
                        <span className="detail-value">{analysis.room_type?.replace('_', ' ')}</span>
                    </div>
                    <div className="detail-item">
                        <span className="detail-label">Chi Flow</span>
                        <span className={`detail-value chi-${analysis.chi_flow?.quality}`}>
                            {analysis.chi_flow?.quality}
                        </span>
                    </div>
                    <div className="detail-item">
                        <span className="detail-label">Dominant Element</span>
                        <span className="detail-value">{analysis.element_balance?.dominant}</span>
                    </div>
                </div>
            </div>

            {/* Command Position */}
            <div className="report-section">
                <h3>
                    {analysis.command_position?.is_commanding ? '✅' : '⚠️'} Command Position
                </h3>
                <div className={`command-card ${analysis.command_position?.is_commanding ? 'commanding' : 'not-commanding'}`}>
                    <p><strong>Primary:</strong> {analysis.command_position?.primary_furniture}</p>
                    <p>{analysis.command_position?.explanation}</p>
                </div>
            </div>

            {/* Violations */}
            {analysis.violations?.length > 0 && (
                <div className="report-section">
                    <h3>⛔ Issues Found ({analysis.violations.length})</h3>
                    <div className="violations-list">
                        {analysis.violations
                            .sort((a, b) => b.severity - a.severity)
                            .map((v, i) => (
                                <div key={i} className={`violation-card severity-${v.severity}`}>
                                    <div className="violation-header">
                                        <span
                                            className="severity-badge"
                                            role="img"
                                            aria-label={`Severity: ${SEVERITY_LABELS[v.severity] || 'Unknown'} (${v.severity}/5)`}
                                            title={`Severity: ${SEVERITY_LABELS[v.severity] || 'Unknown'}`}
                                        >
                                            {'●'.repeat(v.severity)}{'○'.repeat(5 - v.severity)}
                                        </span>
                                        <span className="rule-id">{v.rule_id}</span>
                                    </div>
                                    <p className="violation-desc">{v.description}</p>
                                    <p className="violation-fix">💡 {v.recommendation}</p>
                                </div>
                            ))}
                    </div>
                </div>
            )}

            {/* Positive Aspects */}
            {analysis.positive_aspects?.length > 0 && (
                <div className="report-section">
                    <h3>✨ What's Working Well</h3>
                    <ul className="positives-list">
                        {analysis.positive_aspects.map((p, i) => (
                            <li key={i}>{p}</li>
                        ))}
                    </ul>
                </div>
            )}

            {/* Element Balance */}
            {analysis.element_balance && (
                <div className="report-section">
                    <h3>☯ Five Element Balance</h3>
                    <div className="element-card">
                        <p><strong>Dominant:</strong> {analysis.element_balance.dominant}</p>
                        {analysis.element_balance.missing?.length > 0 && (
                            <p><strong>Missing:</strong> {analysis.element_balance.missing.join(', ')}</p>
                        )}
                        <p><strong>Suggestion:</strong> {analysis.element_balance.suggestion}</p>
                    </div>
                </div>
            )}

            {/* Chi Flow Detail */}
            {analysis.chi_flow && (
                <div className="report-section">
                    <h3>🌊 Chi Flow Analysis</h3>
                    <p className="chi-description">{analysis.chi_flow.description}</p>
                </div>
            )}
        </div>
    );
}
