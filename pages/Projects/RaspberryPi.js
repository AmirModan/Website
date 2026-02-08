import Head from 'next/head';
import { HomeIcon } from '@heroicons/react/24/outline';

function RaspberryPi() {
  return (
    <>
      <Head>
        <title>Raspberry Pi</title>
        <meta name="viewport" content="width=device-width, initial-scale=1" />
      </Head>

      <div className="min-h-screen bg-gradient-to-br from-slate-900 via-emerald-900 to-slate-900">
        {/* Home Button */}
        <div className="fixed top-4 left-4 z-50">
          <a
            href="/"
            className="group flex items-center justify-center w-12 h-12 bg-white/10 backdrop-blur-lg rounded-full border border-white/20 hover:bg-white/20 hover:border-white/30 transition-all duration-300 shadow-lg hover:shadow-xl hover:scale-110 active:scale-95"
            aria-label="Home"
          >
            <HomeIcon className="w-6 h-6 text-white group-hover:text-emerald-300 transition-colors duration-200" />
          </a>
        </div>

        <div className="container mx-auto px-4 py-8">
          <div className="text-center mb-12">
            <h1 className="text-5xl font-bold text-white mb-4 bg-clip-text text-transparent bg-gradient-to-r from-emerald-400 to-teal-600">
              Raspberry Pi Projects
            </h1>
            <div className="w-32 h-1 bg-gradient-to-r from-emerald-400 to-teal-600 mx-auto"></div>
          </div>

          <div className="bg-white/10 backdrop-blur-lg rounded-3xl p-8 shadow-2xl border border-white/20 hover:shadow-emerald-500/20 transition-all duration-300">
            <div className="grid lg:grid-cols-2 gap-8">
              {/* LED Project */}
              <div className="bg-white/5 backdrop-blur rounded-2xl p-6 border border-white/10">
                <h2 className="text-2xl font-bold text-white mb-6 text-center">
                  LED Light Show
                </h2>

                <div className="relative overflow-hidden rounded-2xl shadow-lg mb-6 group">
                  <iframe
                    src="https://www.youtube.com/embed/3KMFsbovLWM"
                    className="w-full aspect-video rounded-2xl"
                    frameBorder="0"
                    allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture"
                    allowFullScreen
                  ></iframe>
                </div>

                <div className="text-gray-100 space-y-4 mb-6">
                  <p className="leading-relaxed">
                    This project was the result of me trying to create a light
                    show using the Raspberry Pi.
                  </p>
                  <p className="leading-relaxed">
                    A button is used to alternate between each of the 16 cases
                    showed in the video.
                  </p>
                  <p className="leading-relaxed">
                    The first 8 cases were created solely using loops to iterate
                    which led was on at a given moment.
                  </p>
                  <p className="leading-relaxed">
                    The second 8 cases were like the first 8, except that pulse
                    width modulation (PWM) was used to brighten all led's to
                    some degree, with the brightest being where the "pulse" was
                    located.
                  </p>
                  <p className="leading-relaxed">
                    The RGB light on the right has its own program where it uses
                    PWM to cycle through the entire color spectrum.
                  </p>
                </div>

                <div className="bg-gradient-to-br from-emerald-500/20 to-teal-500/20 backdrop-blur rounded-xl p-4 border border-white/10">
                  <h3 className="text-lg font-bold text-white mb-3">
                    Source Code
                  </h3>
                  <div className="space-y-2">
                    <a
                      href="src/RaspberryPi/3.c"
                      className="block text-emerald-300 hover:text-emerald-400 hover:bg-white/10 px-3 py-2 rounded-lg transition-all duration-200"
                    >
                      Source Code for 8 LED's
                    </a>
                    <a
                      href="src/RaspberryPi/rgb.c"
                      className="block text-emerald-300 hover:text-emerald-400 hover:bg-white/10 px-3 py-2 rounded-lg transition-all duration-200"
                    >
                      Source Code for RGB LED
                    </a>
                  </div>
                </div>
              </div>

              {/* DC Motor Project */}
              <div className="bg-white/5 backdrop-blur rounded-2xl p-6 border border-white/10">
                <h2 className="text-2xl font-bold text-white mb-6 text-center">
                  DC Motor Control
                </h2>

                <div className="relative overflow-hidden rounded-2xl shadow-lg mb-6 group">
                  <iframe
                    src="https://www.youtube.com/embed/quDkPa8eYJs"
                    className="w-full aspect-video rounded-2xl"
                    frameBorder="0"
                    allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture"
                    allowFullScreen
                  ></iframe>
                </div>

                <div className="text-gray-100 space-y-4 mb-6">
                  <p className="leading-relaxed">
                    In this project, a fan is periodically spun in different
                    directions using a DC Motor.
                  </p>
                  <p className="leading-relaxed">
                    This could not have been done without the use of the
                    integrated circuit (IC) L293D.
                  </p>
                  <p className="leading-relaxed">
                    The L293D is a dual H-bridge motor driver integrated circuit
                    that can drive two DC motors or one stepper motor
                    simultaneously.
                  </p>
                  <p className="leading-relaxed">
                    The project demonstrates precise control over motor speed
                    and direction using PWM signals from the Raspberry Pi GPIO
                    pins.
                  </p>
                </div>

                <div className="bg-gradient-to-br from-teal-500/20 to-cyan-500/20 backdrop-blur rounded-xl p-4 border border-white/10">
                  <h3 className="text-lg font-bold text-white mb-3">
                    Source Code
                  </h3>
                  <div className="space-y-2">
                    <a
                      href="src/RaspberryPi/motor.c"
                      className="block text-teal-300 hover:text-teal-400 hover:bg-white/10 px-3 py-2 rounded-lg transition-all duration-200"
                    >
                      Source Code for DC Motor
                    </a>
                  </div>
                </div>
              </div>
            </div>

            {/* Additional Information */}
            <div className="mt-8 bg-white/5 backdrop-blur rounded-2xl p-6 border border-white/10">
              <h3 className="text-xl font-bold text-white mb-4">
                Technical Details
              </h3>
              <div className="grid md:grid-cols-2 gap-6 text-gray-300">
                <div>
                  <h4 className="font-semibold text-emerald-300 mb-3">
                    LED Project Components:
                  </h4>
                  <ul className="space-y-1 list-disc list-inside">
                    <li>Raspberry Pi 3 Model B</li>
                    <li>8x Standard LEDs</li>
                    <li>1x RGB LED</li>
                    <li>Push button</li>
                    <li>Resistors (220Ω, 330Ω)</li>
                    <li>Breadboard and jumper wires</li>
                  </ul>
                </div>
                <div>
                  <h4 className="font-semibold text-teal-300 mb-3">
                    DC Motor Project Components:
                  </h4>
                  <ul className="space-y-1 list-disc list-inside">
                    <li>Raspberry Pi 3 Model B</li>
                    <li>DC Motor with fan attachment</li>
                    <li>L293D Motor Driver IC</li>
                    <li>External power supply</li>
                    <li>Diodes and capacitors</li>
                    <li>Breadboard and jumper wires</li>
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

export default RaspberryPi;
