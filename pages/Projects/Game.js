import Head from 'next/head';
import { useRouter } from 'next/router';
import { useEffect } from 'react';

function Game() {
  const router = useRouter();

  useEffect(() => {
    // Load Phaser scripts dynamically
    const phaserScript = document.createElement('script');
    phaserScript.src =
      'https://cdn.jsdelivr.net/npm/phaser@3.16.2/dist/phaser.min.js';
    phaserScript.async = true;

    const mainMenuScript = document.createElement('script');
    mainMenuScript.src = '/src/Game/MainMenu.js';
    mainMenuScript.async = true;

    const levelScript = document.createElement('script');
    levelScript.src = '/src/Game/Level.js';
    levelScript.async = true;

    const gameScript = document.createElement('script');
    gameScript.src = '/src/Game/game.js';
    gameScript.async = true;

    document.body.appendChild(phaserScript);

    phaserScript.onload = () => {
      document.body.appendChild(mainMenuScript);
      document.body.appendChild(levelScript);
      document.body.appendChild(gameScript);
    };

    return () => {
      document.body.removeChild(phaserScript);
      if (document.body.contains(mainMenuScript)) {
        document.body.removeChild(mainMenuScript);
      }
      if (document.body.contains(levelScript)) {
        document.body.removeChild(levelScript);
      }
      if (document.body.contains(gameScript)) {
        document.body.removeChild(gameScript);
      }
    };
  }, []);

  return (
    <>
      <Head>
        <title>Game</title>
        <meta name="viewport" content="width=device-width, initial-scale=1" />
      </Head>

      <div className="min-h-screen bg-gradient-to-br from-slate-900 via-violet-900 to-slate-900">
        <div className="container mx-auto px-4 py-8">
          <div className="text-center mb-12">
            <h1 className="text-5xl font-bold text-white mb-4 bg-clip-text text-transparent bg-gradient-to-r from-violet-400 to-purple-600">
              Web Game Project
            </h1>
            <div className="w-32 h-1 bg-gradient-to-r from-violet-400 to-purple-600 mx-auto"></div>
            <p className="text-gray-300 mt-4 max-w-2xl mx-auto">
              An interactive web game built with Phaser.js. Click below to start
              playing!
            </p>
          </div>

          <div className="bg-white/10 backdrop-blur-lg rounded-3xl p-8 shadow-2xl border border-white/20 hover:shadow-violet-500/20 transition-all duration-300">
            <div className="bg-white/5 backdrop-blur rounded-2xl p-6 border border-white/10 mb-8">
              <h2 className="text-2xl font-bold text-white mb-4">
                Game Features
              </h2>
              <ul className="text-gray-300 space-y-2 list-disc list-inside">
                <li>Interactive gameplay with smooth controls</li>
                <li>Multiple levels with increasing difficulty</li>
                <li>Visual effects and animations</li>
                <li>Responsive design for all devices</li>
                <li>Sound effects and background music</li>
              </ul>
            </div>

            <div className="bg-gradient-to-br from-violet-500/20 to-purple-500/20 backdrop-blur rounded-2xl p-8 border border-white/10 text-center">
              <h3 className="text-xl font-bold text-white mb-6">
                Game Container
              </h3>
              <div
                id="game-container"
                className="w-full max-w-4xl mx-auto bg-black/50 rounded-2xl overflow-hidden shadow-2xl border-2 border-violet-400/30"
              >
                {/* Phaser game will render here */}
                <div className="aspect-video flex items-center justify-center">
                  <p className="text-violet-300 text-lg">Loading game...</p>
                </div>
              </div>
              <div className="mt-6">
                <button
                  onClick={() => window.location.reload()}
                  className="bg-gradient-to-r from-violet-500 to-purple-600 text-white px-8 py-3 rounded-full font-semibold hover:from-violet-600 hover:to-purple-700 transition-all duration-200 transform hover:scale-105 active:scale-95 shadow-lg"
                >
                  Restart Game
                </button>
              </div>
            </div>

            <div className="mt-8 bg-white/5 backdrop-blur rounded-2xl p-6 border border-white/10">
              <h3 className="text-xl font-bold text-white mb-4">Controls</h3>
              <div className="grid md:grid-cols-2 gap-4 text-gray-300">
                <div>
                  <h4 className="font-semibold text-violet-300 mb-2">
                    Desktop:
                  </h4>
                  <ul className="space-y-1">
                    <li>Arrow Keys - Move character</li>
                    <li>Space - Jump/Action</li>
                    <li>Mouse - Menu navigation</li>
                  </ul>
                </div>
                <div>
                  <h4 className="font-semibold text-purple-300 mb-2">
                    Mobile:
                  </h4>
                  <ul className="space-y-1">
                    <li>Touch controls - Move and interact</li>
                    <li>Swipe - Navigate menus</li>
                    <li>Tap - Select actions</li>
                  </ul>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </>
  );
}

export default Game;
