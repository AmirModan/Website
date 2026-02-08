import Head from 'next/head';
import Header from '../../public/components/Header';
import CommentBox from '../../public/components/CommentBox';
import { HomeIcon } from '@heroicons/react/24/outline';

function ARM() {
  return (
    <>
      <Head>
        <title>ARM</title>
        <meta name="viewport" content="width=device-width, initial-scale=1" />
      </Head>

      <div className="min-h-screen bg-gradient-to-br from-slate-900 via-purple-900 to-slate-900">
        {/* Home Button */}
        <div className="fixed top-4 left-4 z-50">
          <a
            href="/"
            className="group flex items-center justify-center w-12 h-12 bg-white/10 backdrop-blur-lg rounded-full border border-white/20 hover:bg-white/20 hover:border-white/30 transition-all duration-300 shadow-lg hover:shadow-xl hover:scale-110 active:scale-95"
            aria-label="Home"
          >
            <HomeIcon className="w-6 h-6 text-white group-hover:text-blue-300 transition-colors duration-200" />
          </a>
        </div>

        <div className="container mx-auto px-4 py-8">
          <div className="text-center mb-12">
            <h1 className="text-5xl font-bold text-white mb-4 bg-clip-text text-transparent bg-gradient-to-r from-blue-400 to-purple-600">
              ARM Microcontroller Projects
            </h1>
            <div className="w-32 h-1 bg-gradient-to-r from-blue-400 to-purple-600 mx-auto"></div>
          </div>

          <div className="space-y-16">
            {/* Smart Home Security System */}
            <div className="bg-white/10 backdrop-blur-lg rounded-3xl p-8 shadow-2xl border border-white/20 hover:shadow-purple-500/20 transition-all duration-300">
              <h2 className="text-3xl font-bold text-white mb-8 text-center">
                Smart Home Security System
              </h2>

              <div className="grid lg:grid-cols-2 gap-8 mb-8">
                <div className="relative overflow-hidden rounded-2xl shadow-lg">
                  <div className="aspect-w-16 aspect-h-9">
                    <iframe
                      src="https://www.youtube.com/embed/4zdDbEcjosg"
                      className="w-full h-96 rounded-2xl"
                      frameBorder="0"
                      allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture"
                      allowFullScreen
                    ></iframe>
                  </div>
                </div>

                <div className="bg-white/5 backdrop-blur rounded-2xl p-6 border border-white/10">
                  <div className="text-gray-100 space-y-4">
                    <p className="leading-relaxed">
                      When we were first tasked with implementing an Embedded
                      System using the TM4C123 Microcontroller, we wanted to
                      develop a low-cost, yet practical device that solves an
                      issue common in many societies, Home Burglary.
                    </p>
                    <p className="leading-relaxed">
                      Because there are already several professional security
                      systems on the market today with prices starting at over a
                      hundred dollars, we wanted our security system to be
                      extremely cost-effective so that anyone, especially poorer
                      communities in which burglary is most rampant, can utilize
                      our technology.
                    </p>
                    <p className="leading-relaxed">
                      Therefore, we will use several low-cost, yet accurate
                      peripherals that will help detect signs of burglary as
                      well as preventing it, all being controlled by the Tiva
                      Board.
                    </p>
                    <p className="leading-relaxed">
                      The Tiva Board will also interface with a Raspberry Pi in
                      order to add more advanced features to the Security
                      System.
                    </p>
                  </div>
                </div>
              </div>

              <div className="mb-8">
                <div className="bg-white/5 backdrop-blur rounded-2xl overflow-hidden border border-white/10">
                  <object
                    data="/src/TM4C/Security_System/SmartHomeSecuritySystem_Report.pdf"
                    type="application/pdf"
                    className="w-full h-[600px] rounded-2xl"
                  >
                    <embed
                      src="https://drive.google.com/file/d/1Xh2ga4TkpMtJ5WAThnlUK6OF-y9Nrgze/preview?usp=sharing"
                      className="w-full h-[600px]"
                    />
                  </object>
                </div>
              </div>

              <div className="grid md:grid-cols-3 gap-8">
                <div className="bg-gradient-to-br from-blue-500/20 to-purple-500/20 backdrop-blur rounded-2xl p-6 border border-white/10">
                  <h3 className="text-xl font-bold text-white mb-4">
                    TM4C Source Code
                  </h3>
                  <div className="space-y-2">
                    {[
                      'Security_System.c',
                      'Accelerometer.c',
                      'Accelerometer.h',
                      'Encoder.c',
                      'Encoder.h',
                      'Button.c',
                      'Button.h',
                      'LCD.c',
                      'LCD.h',
                    ].map((file) => (
                      <a
                        key={file}
                        href={`/src/TM4C/Security_System/${file}`}
                        className="block text-blue-300 hover:text-blue-400 hover:bg-white/10 px-3 py-2 rounded-lg transition-all duration-200"
                      >
                        {file}
                      </a>
                    ))}
                  </div>
                </div>

                <div className="bg-gradient-to-br from-purple-500/20 to-pink-500/20 backdrop-blur rounded-2xl p-6 border border-white/10">
                  <h3 className="text-xl font-bold text-white mb-4">
                    Raspberry Pi Source Code
                  </h3>
                  <div className="space-y-2">
                    {['CameraBreach.py', 'TextServer.py', 'ImageServer.py'].map(
                      (file) => (
                        <a
                          key={file}
                          href={`/src/TM4C/Security_System/Server/${file}`}
                          className="block text-purple-300 hover:text-purple-400 hover:bg-white/10 px-3 py-2 rounded-lg transition-all duration-200"
                        >
                          {file}
                        </a>
                      )
                    )}
                  </div>
                </div>
              </div>
            </div>

            {/* Quake Detector */}
            <div className="bg-white/10 backdrop-blur-lg rounded-3xl p-8 shadow-2xl border border-white/20 hover:shadow-blue-500/20 transition-all duration-300">
              <h2 className="text-3xl font-bold text-white mb-8 text-center">
                Quake Detector
              </h2>

              <div className="grid lg:grid-cols-2 gap-8 mb-8">
                <div className="relative overflow-hidden rounded-2xl shadow-lg">
                  <div className="aspect-w-16 aspect-h-9">
                    <iframe
                      src="https://www.youtube.com/embed/Y5qcNP1vufc"
                      className="w-full h-96 rounded-2xl"
                      frameBorder="0"
                      allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture"
                      allowFullScreen
                    ></iframe>
                  </div>
                </div>

                <div className="bg-white/5 backdrop-blur rounded-2xl p-6 border border-white/10">
                  <div className="text-gray-100 space-y-4">
                    <p className="leading-relaxed">
                      Throughout this project, we will design an Embedded System
                      capable of detecting Seismic Activity using an
                      Accelerometer. The system will display on an LCD screen
                      how much Seismic Activity is currently being experienced
                      and, if that amount were to surpass a set threshold, the
                      system will classify this as a Quake and warn the user.
                    </p>
                    <p className="leading-relaxed">
                      An overheating prevention mechanism will also be
                      implemented which will reduce power consumption of the
                      system by sending the microcontroller into its Hibernation
                      mode whenever the sampled internal temperature is past the
                      safe threshold.
                    </p>
                    <p className="leading-relaxed">
                      Both the threshold for Seismic Activity and Temperature
                      can be modified by the user via a Rotary Encoder.
                    </p>
                  </div>
                </div>
              </div>

              <div className="mb-8">
                <div className="bg-white/5 backdrop-blur rounded-2xl overflow-hidden border border-white/10">
                  <object
                    data="/src/TM4C/Quake_Detector/QuakeDetector_Report.pdf"
                    type="application/pdf"
                    className="w-full h-[600px] rounded-2xl"
                  >
                    <embed
                      src="https://drive.google.com/file/d/13qnczD974Y4ZOMxJ7BV-gu0hkcbsXaXF/preview?usp=sharing"
                      className="w-full h-[600px]"
                    />
                  </object>
                </div>
              </div>

              <div className="grid md:grid-cols-3 gap-8">
                <div className="md:col-start-2">
                  <div className="bg-gradient-to-br from-blue-500/20 to-purple-500/20 backdrop-blur rounded-2xl p-6 border border-white/10">
                    <h3 className="text-xl font-bold text-white mb-4">
                      TM4C Source Code
                    </h3>
                    <div className="space-y-2">
                      {[
                        'Quake_Detector.c',
                        'Accelerometer.c',
                        'Accelerometer.h',
                        'Encoder.c',
                        'Encoder.h',
                        'Button.c',
                        'Button.h',
                        'LCD.c',
                        'LCD.h',
                      ].map((file) => (
                        <a
                          key={file}
                          href={`/src/TM4C/Quake_Detector/${file}`}
                          className="block text-blue-300 hover:text-blue-400 hover:bg-white/10 px-3 py-2 rounded-lg transition-all duration-200"
                        >
                          {file}
                        </a>
                      ))}
                    </div>
                  </div>
                </div>
              </div>

              <div className="mt-8">
                <CommentBox pageName="Quake Detector" />
              </div>
            </div>
          </div>
        </div>
      </div>
    </>
  );
}

export default ARM;
