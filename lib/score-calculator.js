/**
 * Calculate a weighted Feng Shui score from the analysis results.
 * This serves as a fallback / validation on top of the Gemini‑provided score.
 */

const SEVERITY_WEIGHTS = {
    5: 15,  // Critical violations lose 15 points each
    4: 10,
    3: 6,
    2: 3,
    1: 1
};

const POSITIVE_BONUS = 3; // Each positive aspect adds 3 points

/**
 * Compute a validated score from analysis data.
 * @param {Object} analysis - The parsed Gemini response
 * @returns {number} Score 0-100
 */
export function calculateScore(analysis) {
    if (!analysis || !analysis.violations) return 50;

    let score = 100;

    // Deduct for violations
    for (const violation of analysis.violations) {
        const weight = SEVERITY_WEIGHTS[violation.severity] || 5;
        score -= weight;
    }

    // Bonus for positive aspects
    if (analysis.positive_aspects) {
        score += analysis.positive_aspects.length * POSITIVE_BONUS;
    }

    // Command position bonus/penalty
    if (analysis.command_position) {
        if (analysis.command_position.is_commanding) {
            score += 10;
        } else {
            score -= 10;
        }
    }

    // Clamp to 0-100
    return Math.max(0, Math.min(100, Math.round(score)));
}

/**
 * Get a letter grade and color for the score.
 */
export function getScoreGrade(score) {
    if (score >= 90) return { grade: 'A+', color: '#00e676', label: 'Excellent' };
    if (score >= 80) return { grade: 'A', color: '#66bb6a', label: 'Very Good' };
    if (score >= 70) return { grade: 'B', color: '#9ccc65', label: 'Good' };
    if (score >= 60) return { grade: 'C+', color: '#ffee58', label: 'Fair' };
    if (score >= 50) return { grade: 'C', color: '#ffa726', label: 'Needs Work' };
    if (score >= 40) return { grade: 'D', color: '#ff7043', label: 'Poor' };
    return { grade: 'F', color: '#ef5350', label: 'Major Issues' };
}
