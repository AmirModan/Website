import Head from 'next/head';
import CommentBox from '../../public/components/CommentBox';
import { HomeIcon } from '@heroicons/react/24/outline';

function CNNGestureRecognition() {
  return (
    <>
      <Head>
        <title>CNN Gesture Recognition</title>
        <meta name="viewport" content="width=device-width, initial-scale=1" />
      </Head>

      <div className="min-h-screen bg-gradient-to-br from-slate-900 via-orange-900 to-slate-900">
        {/* Home Button */}
        <div className="fixed top-4 left-4 z-50">
          <a
            href="/"
            className="group flex items-center justify-center w-12 h-12 bg-white/10 backdrop-blur-lg rounded-full border border-white/20 hover:bg-white/20 hover:border-white/30 transition-all duration-300 shadow-lg hover:shadow-xl hover:scale-110 active:scale-95"
            aria-label="Home"
          >
            <HomeIcon className="w-6 h-6 text-white group-hover:text-orange-300 transition-colors duration-200" />
          </a>
        </div>

        <div className="container mx-auto px-4 py-8">
          <div className="text-center mb-12">
            <h1 className="text-5xl font-bold text-white mb-4 bg-clip-text text-transparent bg-gradient-to-r from-orange-400 to-red-600">
              Gesture Recognition with CNN
            </h1>
            <div className="w-32 h-1 bg-gradient-to-r from-orange-400 to-red-600 mx-auto"></div>
          </div>

          <div className="bg-white/10 backdrop-blur-lg rounded-3xl p-8 shadow-2xl border border-white/20 hover:shadow-orange-500/20 transition-all duration-300">
            <div className="mb-8">
              <div className="relative overflow-hidden rounded-2xl shadow-lg group">
                <img
                  src="/Images/GestureRecognition.png"
                  alt="Gesture Recognition"
                  className="w-full h-96 object-cover rounded-2xl transition-transform duration-300 group-hover:scale-105"
                />
                <div className="absolute inset-0 bg-gradient-to-t from-black/30 to-transparent rounded-2xl"></div>
              </div>
            </div>

            <div className="bg-white/5 backdrop-blur rounded-2xl p-6 border border-white/10 mb-8">
              <div className="text-gray-100 space-y-4">
                <p className="leading-relaxed">
                  The Neural-Machine Interface we will design will be capable of
                  detecting the user's intent based on muscle activity from
                  within their arm. The Myo Armband will be used as a wearable
                  and wireless alternative to standard lab equipment which will
                  be responsible for measuring this physical activity in the
                  form of Surface Electromyography (EMG) signals.
                </p>
                <p className="leading-relaxed">
                  The Myo Armband will then digitize this data and send it to a
                  computer which will act as the central device in our system.
                </p>
                <p className="leading-relaxed">
                  A Convolutional Neural Network (CNN) will be responsible for
                  classifying raw EMG signals into one of a set of gestures
                  based on Supervised Learning.
                </p>
                <p className="leading-relaxed">
                  While using Neural Networks can be much more costly than
                  standard machine learning algorithms in terms of computation,
                  they may prove to boost performance when it comes to
                  classifying large and complex data such as the data we intend
                  to receive from the Myo Armband.
                </p>
                <p className="leading-relaxed">
                  The computer will also provide a Graphical User Interface so
                  that the final product will be usable.
                </p>
              </div>
            </div>

            <div className="mb-8">
              <div className="bg-white/5 backdrop-blur rounded-2xl overflow-hidden border border-white/10">
                <object
                  data="/src/CNNGestureRecognition/engr845_FinalReport_Modan_Botejue.pdf"
                  type="application/pdf"
                  className="w-full h-[600px] rounded-2xl"
                >
                  <embed
                    src="https://drive.google.com/file/d/1F3MXhXv23PFQG56xL-Jgu9hKc_Cni-lJ/preview?usp=sharing"
                    className="w-full h-[600px]"
                  />
                </object>
              </div>
            </div>

            <div className="grid md:grid-cols-3 gap-6">
              <div className="md:col-start-2">
                <div className="bg-gradient-to-br from-orange-500/20 to-red-500/20 backdrop-blur rounded-2xl p-6 border border-white/10">
                  <h3 className="text-xl font-bold text-white mb-4">
                    Source Code
                  </h3>
                  <div className="space-y-2">
                    {[
                      'CNN.py',
                      'DataRetrieval.py',
                      'Dataset.py',
                      'gui.py',
                      'main.py',
                    ].map((file) => (
                      <a
                        key={file}
                        href={`/src/CNNGestureRecognition/${file}`}
                        className="block text-orange-300 hover:text-orange-400 hover:bg-white/10 px-3 py-2 rounded-lg transition-all duration-200"
                      >
                        {file}
                      </a>
                    ))}
                  </div>
                </div>
              </div>
            </div>

            <div className="mt-8">
              <CommentBox pageName="Gesture Recognition" />
            </div>
          </div>
        </div>
      </div>
    </>
  );
}

export default CNNGestureRecognition;
