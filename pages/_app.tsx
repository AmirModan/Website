import '../styles/globals.css';
import type { AppProps } from 'next/app';
import { ReactElement, ReactNode } from 'react';

function MyApp({ Component, pageProps }: AppProps) {
  return <>{Component && <Component {...pageProps} />}</>;
}
export default MyApp;
