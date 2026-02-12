import { Inter, Outfit } from 'next/font/google';
import './globals.css';
import NavBar from '@/components/NavBar';

const inter = Inter({
  subsets: ['latin'],
  display: 'swap',
  variable: '--font-body',
  weight: ['300', '400', '500', '600', '700', '800'],
});

const outfit = Outfit({
  subsets: ['latin'],
  display: 'swap',
  variable: '--font-display',
  weight: ['400', '500', '600', '700', '800'],
});

export const metadata = {
  title: 'Feng Shui Designer — AI Room Harmony Analysis',
  description: 'Upload a room photo and get AI-powered Feng Shui analysis with spatial mapping, command position evaluation, and actionable recommendations.',
};

export default function RootLayout({ children }) {
  return (
    <html lang="en">
      <body className={`${inter.variable} ${outfit.variable}`}>
        <NavBar />
        {children}
      </body>
    </html>
  );
}
