import Head from 'next/head';
import Header from '../../public/components/Header';
import CommentBox from '../../public/components/CommentBox';
import { HomeIcon } from '@heroicons/react/24/outline';

function FPGA() {
  return (
    <>
      <Head>
        <title>FPGA</title>
        <meta name="viewport" content="width=device-width, initial-scale=1" />
      </Head>

      <div className="min-h-screen bg-gradient-to-br from-slate-900 via-green-900 to-slate-900">
        {/* Home Button */}
        <div className="fixed top-4 left-4 z-50">
          <a
            href="/"
            className="group flex items-center justify-center w-12 h-12 bg-white/10 backdrop-blur-lg rounded-full border border-white/20 hover:bg-white/20 hover:border-white/30 transition-all duration-300 shadow-lg hover:shadow-xl hover:scale-110 active:scale-95"
            aria-label="Home"
          >
            <HomeIcon className="w-6 h-6 text-white group-hover:text-green-300 transition-colors duration-200" />
          </a>
        </div>

        <div className="container mx-auto px-4 py-8">
          <div className="text-center mb-12">
            <h1 className="text-5xl font-bold text-white mb-4 bg-clip-text text-transparent bg-gradient-to-r from-green-400 to-blue-600">
              FPGA Projects
            </h1>
            <div className="w-32 h-1 bg-gradient-to-r from-green-400 to-blue-600 mx-auto"></div>
          </div>

          <div className="bg-white/10 backdrop-blur-lg rounded-3xl p-8 shadow-2xl border border-white/20 hover:shadow-green-500/20 transition-all duration-300">
            <h2 className="text-3xl font-bold text-white mb-8 text-center">
              Motion Estimator FPGA Implementation
            </h2>

            <div className="grid md:grid-cols-3 gap-6 mb-8">
              {[
                { src: '/Images/FPGA-Ex.jpg', alt: 'FPGA Example' },
                { src: '/Images/FPGA-WAV.jpg', alt: 'FPGA Waveform' },
                { src: '/Images/FPGA-Graph.jpg', alt: 'FPGA Graph' },
              ].map((image, index) => (
                <div
                  key={index}
                  className="relative overflow-hidden rounded-2xl shadow-lg group"
                >
                  <img
                    src={image.src}
                    alt={image.alt}
                    className="w-full h-64 object-cover rounded-2xl transition-transform duration-300 group-hover:scale-110"
                  />
                  <div className="absolute inset-0 bg-gradient-to-t from-black/50 to-transparent rounded-2xl"></div>
                </div>
              ))}
            </div>

            <div className="bg-white/5 backdrop-blur rounded-2xl p-6 border border-white/10 mb-8">
              <div className="text-gray-100 space-y-4">
                <p className="leading-relaxed">
                  Before initiating the physical design process of our Motion
                  Estimator ASIC, we will first emulate the Verilog Code we
                  wrote on an FPGA as FPGA's can easily be reprogrammed as
                  opposed to an ASIC which we would have to dispose of and
                  remanufacture.
                </p>
                <p className="leading-relaxed">
                  This will drastically reduce the consequences should there be
                  an error in our design.
                </p>
              </div>
            </div>

            <div className="text-center mb-8">
              <h3 className="text-xl text-white">
                Click{' '}
                <a
                  href="./IC"
                  className="text-green-400 hover:text-green-300 underline transition-colors font-bold"
                >
                  here
                </a>{' '}
                to go to ASIC Implementation of Motion Estimator
              </h3>
            </div>

            <div className="grid md:grid-cols-3 gap-6">
              <div className="md:col-start-2">
                <div className="bg-gradient-to-br from-green-500/20 to-blue-500/20 backdrop-blur rounded-2xl p-6 border border-white/10">
                  <h3 className="text-xl font-bold text-white mb-4">
                    Motion Estimator FPGA Design Files
                  </h3>
                  <div className="space-y-2">
                    {['MotionEstimator.v', 'pin_ip.v', 'top.v'].map((file) => (
                      <a
                        key={file}
                        href={`/src/FPGA/Motion_Estimator/${file}`}
                        className="block text-green-300 hover:text-green-400 hover:bg-white/10 px-3 py-2 rounded-lg transition-all duration-200"
                      >
                        {file}
                      </a>
                    ))}
                  </div>
                </div>
              </div>
            </div>

            <div className="mt-8">
              <CommentBox pageName="FPGA" />
            </div>
          </div>
        </div>
      </div>
    </>
  );
}

export default FPGA;
