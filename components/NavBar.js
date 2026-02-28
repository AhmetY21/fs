'use client';

import Link from 'next/link';
import { usePathname } from 'next/navigation';

export default function NavBar() {
    const pathname = usePathname();

    return (
        <header className="app-header">
            <div className="header-content">
                <Link href="/" className="logo">
                    <span className="logo-icon" aria-hidden="true">☯</span>
                    <div>
                        <h1>Feng Shui Designer</h1>
                        <p className="subtitle">AI-Powered Room Harmony Analysis</p>
                    </div>
                </Link>
                <nav className="nav-links">
                    <Link
                        href="/"
                        className={`nav-link ${pathname === '/' ? 'active' : ''}`}
                        aria-current={pathname === '/' ? 'page' : undefined}
                    >
                        Analyze
                    </Link>
                    <Link
                        href="/learn"
                        className={`nav-link ${pathname === '/learn' ? 'active' : ''}`}
                        aria-current={pathname === '/learn' ? 'page' : undefined}
                    >
                        Feng Shui 101
                    </Link>
                </nav>
            </div>
        </header>
    );
}
