'use client';

import { useEffect, useRef } from 'react';

const ELEMENT_COLORS = {
    door: { fill: 'rgba(76, 175, 80, 0.25)', stroke: '#4caf50', label: '🚪' },
    window: { fill: 'rgba(33, 150, 243, 0.25)', stroke: '#2196f3', label: '🪟' },
    bed: { fill: 'rgba(156, 39, 176, 0.25)', stroke: '#9c27b0', label: '🛏️' },
    desk: { fill: 'rgba(255, 152, 0, 0.25)', stroke: '#ff9800', label: '🪑' },
    sofa: { fill: 'rgba(0, 188, 212, 0.25)', stroke: '#00bcd4', label: '🛋️' },
    chair: { fill: 'rgba(121, 85, 72, 0.25)', stroke: '#795548', label: '💺' },
    table: { fill: 'rgba(255, 193, 7, 0.25)', stroke: '#ffc107', label: '🪵' },
    mirror: { fill: 'rgba(224, 224, 224, 0.25)', stroke: '#e0e0e0', label: '🪞' },
    tv: { fill: 'rgba(63, 81, 181, 0.25)', stroke: '#3f51b5', label: '📺' },
    stove: { fill: 'rgba(244, 67, 54, 0.25)', stroke: '#f44336', label: '🔥' },
    sink: { fill: 'rgba(3, 169, 244, 0.25)', stroke: '#03a9f4', label: '🚰' },
    plant: { fill: 'rgba(139, 195, 74, 0.25)', stroke: '#8bc34a', label: '🌿' },
    lamp: { fill: 'rgba(255, 235, 59, 0.25)', stroke: '#ffeb3b', label: '💡' },
    shelf: { fill: 'rgba(158, 158, 158, 0.25)', stroke: '#9e9e9e', label: '📚' },
    wardrobe: { fill: 'rgba(78, 52, 46, 0.25)', stroke: '#4e342e', label: '🗄️' },
    staircase: { fill: 'rgba(96, 125, 139, 0.25)', stroke: '#607d8b', label: '🪜' },
    toilet: { fill: 'rgba(176, 190, 197, 0.25)', stroke: '#b0bec5', label: '🚽' },
    other: { fill: 'rgba(189, 189, 189, 0.25)', stroke: '#bdbdbd', label: '📦' },
};

const srOnlyStyle = {
    position: 'absolute',
    width: '1px',
    height: '1px',
    padding: '0',
    margin: '-1px',
    overflow: 'hidden',
    clip: 'rect(0, 0, 0, 0)',
    whiteSpace: 'nowrap',
    borderWidth: '0',
};

function getPositionDescription(position) {
    if (!position) return 'unknown position';
    const { x, y } = position;

    let v = 'center';
    if (y < 0.33) v = 'top';
    else if (y > 0.66) v = 'bottom';

    let h = 'center';
    if (x < 0.33) h = 'left';
    else if (x > 0.66) h = 'right';

    if (v === 'center' && h === 'center') return 'center';
    return `${v}-${h}`;
}

export default function SpatialOverlay({ imageUrl, elements, commandPosition }) {
    const canvasRef = useRef(null);
    const containerRef = useRef(null);

    useEffect(() => {
        if (!imageUrl || !elements || !canvasRef.current) return;

        const canvas = canvasRef.current;
        const ctx = canvas.getContext('2d');
        const img = new Image();

        img.onload = () => {
            // Size canvas to container width, maintaining aspect ratio
            const container = containerRef.current;
            const displayWidth = container.offsetWidth;
            const scale = displayWidth / img.naturalWidth;
            const displayHeight = img.naturalHeight * scale;

            canvas.width = displayWidth;
            canvas.height = displayHeight;

            // Draw image
            ctx.drawImage(img, 0, 0, displayWidth, displayHeight);

            // Draw elements
            elements.forEach((el) => {
                const colors = ELEMENT_COLORS[el.type] || ELEMENT_COLORS.other;
                const x = el.position.x * displayWidth;
                const y = el.position.y * displayHeight;
                const w = el.size.w * displayWidth;
                const h = el.size.h * displayHeight;

                // Draw bounding box
                ctx.fillStyle = colors.fill;
                ctx.fillRect(x, y, w, h);

                ctx.strokeStyle = colors.stroke;
                ctx.lineWidth = 2;
                ctx.setLineDash([6, 3]);
                ctx.strokeRect(x, y, w, h);
                ctx.setLineDash([]);

                // Draw label
                const label = `${colors.label} ${el.label || el.type}`;
                ctx.font = '600 13px Inter, sans-serif';
                const textMetrics = ctx.measureText(label);
                const textW = textMetrics.width + 12;
                const textH = 22;

                // Label background
                const labelX = x;
                const labelY = y - textH - 4 > 0 ? y - textH - 4 : y;
                ctx.fillStyle = 'rgba(0,0,0,0.75)';
                ctx.beginPath();
                ctx.roundRect(labelX, labelY, textW, textH, 4);
                ctx.fill();

                // Label text
                ctx.fillStyle = colors.stroke;
                ctx.fillText(label, labelX + 6, labelY + 15);
            });

            // Draw command position indicator
            if (commandPosition && commandPosition.primary_furniture) {
                const mainElement = elements.find(
                    el => el.label?.toLowerCase().includes(commandPosition.primary_furniture?.toLowerCase()) ||
                        el.type?.toLowerCase().includes(commandPosition.primary_furniture?.toLowerCase())
                );
                if (mainElement) {
                    const cx = (mainElement.position.x + mainElement.size.w / 2) * displayWidth;
                    const cy = (mainElement.position.y + mainElement.size.h / 2) * displayHeight;
                    const radius = 20;

                    ctx.beginPath();
                    ctx.arc(cx, cy, radius, 0, Math.PI * 2);
                    ctx.strokeStyle = commandPosition.is_commanding ? '#00e676' : '#ff5252';
                    ctx.lineWidth = 3;
                    ctx.stroke();

                    // Command icon
                    ctx.font = '16px sans-serif';
                    ctx.fillText(commandPosition.is_commanding ? '✓' : '✗', cx - 6, cy + 6);
                }
            }
        };

        img.src = imageUrl;
    }, [imageUrl, elements, commandPosition]);

    return (
        <div className="spatial-overlay" ref={containerRef} role="img" aria-label="Room spatial map showing furniture positions">
            <canvas ref={canvasRef} className="overlay-canvas" aria-hidden="true" />

            {/* Screen Reader Description */}
            <div style={srOnlyStyle}>
                <h3>Spatial Layout</h3>
                <ul>
                    {elements?.map((el, i) => {
                        const isCommanding = commandPosition?.primary_furniture &&
                            (el.label?.toLowerCase().includes(commandPosition.primary_furniture.toLowerCase()) ||
                             el.type?.toLowerCase().includes(commandPosition.primary_furniture.toLowerCase()));

                        return (
                            <li key={i}>
                                {el.label || el.type} at {getPositionDescription(el.position)}
                                {isCommanding ? ` (${commandPosition.is_commanding ? 'In Command Position' : 'Not in Command Position'})` : ''}
                            </li>
                        );
                    })}
                </ul>
            </div>

            <div className="overlay-legend" aria-hidden="true">
                <h4>Spatial Map</h4>
                <div className="legend-items">
                    {elements?.map((el, i) => {
                        const colors = ELEMENT_COLORS[el.type] || ELEMENT_COLORS.other;
                        return (
                            <span key={i} className="legend-item">
                                <span className="legend-dot" style={{ background: colors.stroke }} />
                                {el.label || el.type}
                            </span>
                        );
                    })}
                </div>
            </div>
        </div>
    );
}
