import Link from 'next/link';

export const metadata = {
    title: 'Feng Shui 101 — Core Principles & Concepts',
    description: 'Learn the foundational concepts of Feng Shui: Chi energy, Command Position, Five Elements, Bagua Map, and practical tips for harmonious living spaces.',
};

export default function LearnPage() {
    return (
        <main className="app-container learn-page">
            {/* Hero */}
            <section className="learn-hero">
                <span className="hero-icon">🏯</span>
                <h1>Feng Shui 101</h1>
                <p className="hero-subtitle">
                    The ancient art of creating harmony between you and your environment.
                    Learn the core concepts that power our AI analysis.
                </p>
            </section>

            {/* Quick Nav */}
            <nav className="learn-nav">
                <a href="#chi" className="learn-nav-item">Chi Energy</a>
                <a href="#command" className="learn-nav-item">Command Position</a>
                <a href="#elements" className="learn-nav-item">Five Elements</a>
                <a href="#bagua" className="learn-nav-item">Bagua Map</a>
                <a href="#sha-chi" className="learn-nav-item">Sha Chi</a>
                <a href="#room-tips" className="learn-nav-item">Room-by-Room</a>
            </nav>

            {/* Chi Energy */}
            <section className="learn-section" id="chi">
                <div className="section-badge">Foundation</div>
                <h2>Chi (氣) — Life Force Energy</h2>
                <div className="learn-content">
                    <p>
                        <strong>Chi</strong> is the invisible life-force energy that flows through everything —
                        your body, your home, and the natural world. In Feng Shui, the goal is to allow chi
                        to flow <em>gently and freely</em> through your living spaces, like a meandering stream.
                    </p>

                    <div className="concept-grid">
                        <div className="concept-card good">
                            <h4>✅ Good Chi Flow</h4>
                            <ul>
                                <li>Meanders gently through rooms</li>
                                <li>Enters through the front door</li>
                                <li>Flows around curved furniture</li>
                                <li>Pauses in comfortable seating areas</li>
                                <li>Exits gently through windows</li>
                            </ul>
                        </div>
                        <div className="concept-card bad">
                            <h4>❌ Blocked Chi</h4>
                            <ul>
                                <li>Clutter stops energy in corners</li>
                                <li>Closed doors trap stagnant energy</li>
                                <li>Dark, unused rooms accumulate negativity</li>
                                <li>Overfull closets create pressure</li>
                                <li>Items under the bed disturb sleep</li>
                            </ul>
                        </div>
                        <div className="concept-card bad">
                            <h4>⚡ Sha Chi (Killing Energy)</h4>
                            <ul>
                                <li>Long straight hallways accelerate energy</li>
                                <li>Sharp corners point "poison arrows"</li>
                                <li>Door directly facing a window — chi rushes through</li>
                                <li>Exposed beams press down on people</li>
                                <li>Too-fast chi causes anxiety</li>
                            </ul>
                        </div>
                    </div>
                </div>
            </section>

            {/* Command Position */}
            <section className="learn-section" id="command">
                <div className="section-badge">Most Important Rule</div>
                <h2>The Command Position (指揮位)</h2>
                <div className="learn-content">
                    <p>
                        The <strong>Command Position</strong> is the single most important principle in Feng Shui.
                        It determines where the main piece of furniture in each room should be placed —
                        <strong>the bed</strong> in a bedroom, <strong>the desk</strong> in an office,
                        and <strong>the stove</strong> in a kitchen.
                    </p>

                    <div className="command-diagram">
                        <div className="room-diagram">
                            <div className="diagram-label door-label">🚪 Door</div>
                            <div className="diagram-path"></div>
                            <div className="diagram-furniture">🛏️</div>
                            <div className="diagram-label furniture-label">Bed (Command Position)</div>
                            <div className="diagram-sightline">👁️ Clear sightline to door</div>
                        </div>
                    </div>

                    <div className="rules-box">
                        <h4>The Three Rules:</h4>
                        <ol>
                            <li><strong>See the door</strong> — You must have a clear sightline to the entrance while in bed/at desk.</li>
                            <li><strong>Not in direct line</strong> — Don't place furniture directly opposite the door (coffin position for beds).</li>
                            <li><strong>Solid wall behind</strong> — Your back should be supported by a wall, not a window or open space.</li>
                        </ol>
                    </div>
                </div>
            </section>

            {/* Five Elements */}
            <section className="learn-section" id="elements">
                <div className="section-badge">Balance</div>
                <h2>The Five Elements (五行)</h2>
                <div className="learn-content">
                    <p>
                        Everything in the universe — including colors, shapes, materials, and directions —
                        corresponds to one of <strong>five elements</strong>. A balanced room contains all five.
                        They follow a <em>productive cycle</em> (each feeds the next) and a <em>destructive cycle</em> (each weakens another).
                    </p>

                    <div className="elements-grid">
                        <div className="element-card wood">
                            <span className="element-emoji">🌿</span>
                            <h4>Wood</h4>
                            <div className="element-details">
                                <p><strong>Colors:</strong> Green, Brown</p>
                                <p><strong>Shapes:</strong> Rectangular, Columnar</p>
                                <p><strong>Direction:</strong> East, Southeast</p>
                                <p><strong>Represents:</strong> Growth, Vitality</p>
                                <p><strong>Materials:</strong> Plants, Wooden furniture</p>
                            </div>
                        </div>
                        <div className="element-card fire">
                            <span className="element-emoji">🔥</span>
                            <h4>Fire</h4>
                            <div className="element-details">
                                <p><strong>Colors:</strong> Red, Orange, Pink</p>
                                <p><strong>Shapes:</strong> Triangular, Pointed</p>
                                <p><strong>Direction:</strong> South</p>
                                <p><strong>Represents:</strong> Passion, Fame</p>
                                <p><strong>Materials:</strong> Candles, Lights</p>
                            </div>
                        </div>
                        <div className="element-card earth">
                            <span className="element-emoji">🏔️</span>
                            <h4>Earth</h4>
                            <div className="element-details">
                                <p><strong>Colors:</strong> Yellow, Beige, Terracotta</p>
                                <p><strong>Shapes:</strong> Square, Flat</p>
                                <p><strong>Direction:</strong> Center, SW, NE</p>
                                <p><strong>Represents:</strong> Stability, Nourishment</p>
                                <p><strong>Materials:</strong> Ceramics, Stone</p>
                            </div>
                        </div>
                        <div className="element-card metal">
                            <span className="element-emoji">⚙️</span>
                            <h4>Metal</h4>
                            <div className="element-details">
                                <p><strong>Colors:</strong> White, Gold, Silver</p>
                                <p><strong>Shapes:</strong> Round, Spherical</p>
                                <p><strong>Direction:</strong> West, Northwest</p>
                                <p><strong>Represents:</strong> Precision, Clarity</p>
                                <p><strong>Materials:</strong> Metal, Iron, Brass</p>
                            </div>
                        </div>
                        <div className="element-card water">
                            <span className="element-emoji">💧</span>
                            <h4>Water</h4>
                            <div className="element-details">
                                <p><strong>Colors:</strong> Blue, Black</p>
                                <p><strong>Shapes:</strong> Wavy, Irregular</p>
                                <p><strong>Direction:</strong> North</p>
                                <p><strong>Represents:</strong> Wisdom, Career</p>
                                <p><strong>Materials:</strong> Glass, Mirrors, Fountains</p>
                            </div>
                        </div>
                    </div>

                    <div className="cycle-diagram">
                        <p className="cycle-title">🔄 Productive Cycle</p>
                        <p className="cycle-flow">Wood → feeds → Fire → creates → Earth → produces → Metal → carries → Water → nourishes → Wood</p>
                    </div>
                </div>
            </section>

            {/* Bagua Map */}
            <section className="learn-section" id="bagua">
                <div className="section-badge">Map</div>
                <h2>The Bagua Map (八卦)</h2>
                <div className="learn-content">
                    <p>
                        The Bagua is an energy map overlaid on your floor plan. It divides your space into
                        <strong> 9 life areas</strong>, each linked to a specific direction and element.
                        Align the bottom of the Bagua with your front door wall.
                    </p>

                    <div className="bagua-grid">
                        <div className="bagua-cell wealth">
                            <span className="bagua-direction">SE</span>
                            <strong>Wealth</strong>
                            <span className="bagua-element">Wood · Purple</span>
                        </div>
                        <div className="bagua-cell fame">
                            <span className="bagua-direction">S</span>
                            <strong>Fame</strong>
                            <span className="bagua-element">Fire · Red</span>
                        </div>
                        <div className="bagua-cell relationships">
                            <span className="bagua-direction">SW</span>
                            <strong>Love</strong>
                            <span className="bagua-element">Earth · Pink</span>
                        </div>
                        <div className="bagua-cell family">
                            <span className="bagua-direction">E</span>
                            <strong>Family</strong>
                            <span className="bagua-element">Wood · Green</span>
                        </div>
                        <div className="bagua-cell health">
                            <span className="bagua-direction">Center</span>
                            <strong>Health</strong>
                            <span className="bagua-element">Earth · Yellow</span>
                        </div>
                        <div className="bagua-cell children">
                            <span className="bagua-direction">W</span>
                            <strong>Children</strong>
                            <span className="bagua-element">Metal · White</span>
                        </div>
                        <div className="bagua-cell knowledge">
                            <span className="bagua-direction">NE</span>
                            <strong>Knowledge</strong>
                            <span className="bagua-element">Earth · Blue</span>
                        </div>
                        <div className="bagua-cell career">
                            <span className="bagua-direction">N</span>
                            <strong>Career</strong>
                            <span className="bagua-element">Water · Black</span>
                        </div>
                        <div className="bagua-cell helpful">
                            <span className="bagua-direction">NW</span>
                            <strong>Mentors</strong>
                            <span className="bagua-element">Metal · Gray</span>
                        </div>
                    </div>
                    <p className="bagua-note">↑ Front door / entrance wall at bottom ↑</p>
                </div>
            </section>

            {/* Sha Chi */}
            <section className="learn-section" id="sha-chi">
                <div className="section-badge">Avoid</div>
                <h2>Sha Chi — Poison Arrows & Killing Energy</h2>
                <div className="learn-content">
                    <p>
                        <strong>Sha Chi</strong> is aggressive, fast-moving energy caused by sharp angles, long straight lines,
                        and oppressive structures. Unlike beneficial chi that meanders, sha chi shoots in a straight line
                        and creates discomfort.
                    </p>

                    <div className="sha-examples">
                        <div className="sha-card">
                            <span>🗡️</span>
                            <h4>Poison Arrows</h4>
                            <p>Sharp corners of furniture, walls, or shelves pointing at where you sit or sleep. Fix: angle furniture away or use plants to soften.</p>
                        </div>
                        <div className="sha-card">
                            <span>📏</span>
                            <h4>Long Corridors</h4>
                            <p>Narrow hallways act like tunnels, accelerating chi dangerously. Fix: add artwork, rugs, or plants along the walls.</p>
                        </div>
                        <div className="sha-card">
                            <span>🪵</span>
                            <h4>Exposed Beams</h4>
                            <p>Heavy beams above your bed or desk press down with oppressive energy. Fix: drape fabric or paint them the same color as the ceiling.</p>
                        </div>
                        <div className="sha-card">
                            <span>🪞</span>
                            <h4>Mirror Facing Bed</h4>
                            <p>Mirrors bounce energy around the room and can startle you at night. Fix: relocate or cover mirrors at night.</p>
                        </div>
                    </div>
                </div>
            </section>

            {/* Room-by-Room Tips */}
            <section className="learn-section" id="room-tips">
                <div className="section-badge">Practical</div>
                <h2>Room-by-Room Quick Guide</h2>
                <div className="learn-content">
                    <div className="room-tips-grid">
                        <div className="room-tip-card">
                            <h4>🛏️ Bedroom</h4>
                            <ul>
                                <li>Bed in Command Position</li>
                                <li>Solid headboard against wall</li>
                                <li>No mirrors facing the bed</li>
                                <li>Matched nightstands for balance</li>
                                <li>Soft, calming colors (earth tones)</li>
                                <li>No electronics near the bed</li>
                            </ul>
                        </div>
                        <div className="room-tip-card">
                            <h4>💼 Office</h4>
                            <ul>
                                <li>Desk in Command Position</li>
                                <li>Wall behind your back</li>
                                <li>Never sit facing a wall</li>
                                <li>Keep desk organized</li>
                                <li>Add a plant for Wood energy</li>
                                <li>Good task lighting</li>
                            </ul>
                        </div>
                        <div className="room-tip-card">
                            <h4>🛋️ Living Room</h4>
                            <ul>
                                <li>Main sofa against a wall</li>
                                <li>Seating faces the entrance</li>
                                <li>Clear pathways for chi flow</li>
                                <li>Soften sharp coffee table corners</li>
                                <li>Balance all five elements</li>
                                <li>Use layered lighting</li>
                            </ul>
                        </div>
                        <div className="room-tip-card">
                            <h4>🍳 Kitchen</h4>
                            <ul>
                                <li>See the door while cooking</li>
                                <li>Separate stove (fire) and sink (water)</li>
                                <li>Keep stove clean and working</li>
                                <li>Use all burners equally</li>
                                <li>Fresh fruits as Wood element</li>
                                <li>Bright, clean energy</li>
                            </ul>
                        </div>
                        <div className="room-tip-card">
                            <h4>🚪 Entrance</h4>
                            <ul>
                                <li>Clear, uncluttered entryway</li>
                                <li>Good lighting at the door</li>
                                <li>No mirror directly facing door</li>
                                <li>Welcoming mat or plant</li>
                                <li>Door opens fully (no blockage)</li>
                                <li>House number clearly visible</li>
                            </ul>
                        </div>
                        <div className="room-tip-card">
                            <h4>🚿 Bathroom</h4>
                            <ul>
                                <li>Keep toilet lid closed</li>
                                <li>Keep bathroom door closed</li>
                                <li>Add Earth elements (ceramics)</li>
                                <li>Fresh towels and plants</li>
                                <li>Fix any leaks immediately</li>
                                <li>Good ventilation</li>
                            </ul>
                        </div>
                    </div>
                </div>
            </section>

            {/* CTA */}
            <section className="learn-cta">
                <h3>Ready to analyze your space?</h3>
                <p>Upload a photo and get an AI-powered Feng Shui assessment.</p>
                <Link href="/" className="btn btn-primary btn-lg">
                    ☯ Start Analysis
                </Link>
            </section>
        </main>
    );
}
