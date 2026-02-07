import React from 'react';
import { Card } from '../ui/Card';

interface ResearchItem {
  title: string;
  description: string;
  image: string;
  technologies?: string[];
  href?: string;
}

interface ResearchSectionProps {
  researchItems: ResearchItem[];
  title?: string;
  subtitle?: string;
}

export const ResearchSection: React.FC<ResearchSectionProps> = ({
  researchItems,
  title = 'My Research',
  subtitle = 'Advancing technology through academic research and innovation',
}) => {
  return (
    <section className="py-8 sm:py-12 relative">
      {/* Background decoration */}
      <div className="absolute inset-0 bg-gradient-to-b from-accent-900/10 via-transparent to-primary-900/10" />

      <div className="section-container relative z-10">
        {/* Section Header */}
        <div className="text-center mb-12 sm:mb-16">
          <h2 className="text-2xl sm:text-3xl md:text-4xl font-bold mb-3 sm:mb-4">
            <span className="gradient-text">{title}</span>
          </h2>
          <p className="text-lg sm:text-xl text-gray-400 max-w-3xl mx-auto leading-relaxed px-4 sm:px-0">
            {subtitle}
          </p>
        </div>

        {/* Research Items */}
        <div
          className="space-y-12 sm:space-y-16 lg:space-y-20"
          style={{ width: '100%', maxWidth: '1200px', margin: '0 auto' }}
        >
          {researchItems.map((item, index) => (
            <div
              key={item.title}
              className={`flex flex-col ${
                index % 2 === 1 ? 'lg:flex-row-reverse' : 'lg:flex-row'
              } gap-6 sm:gap-8 items-center`}
              style={{ margin: '2rem 0' }}
            >
              <div className="flex-1 w-full">
                <Card
                  className="h-full"
                  style={{ width: '100%', height: '100%' }}
                >
                  <div className="w-full py-6 px-6 overflow-hidden rounded-xl bg-white/5">
                    <div className="w-full aspect-[3/2] max-h-40 overflow-hidden rounded">
                      <img
                        src={item.image}
                        alt={item.title}
                        className="w-full h-full object-contain transition-transform duration-300 hover:scale-105"
                      />
                    </div>
                  </div>
                </Card>
              </div>

              <div className="flex-1 text-center lg:text-left">
                <h3 className="text-2xl sm:text-3xl font-bold text-white mb-3 sm:mb-4">
                  {item.title}
                </h3>
                <p className="text-base sm:text-lg text-gray-300 mb-4 sm:mb-6 leading-relaxed">
                  {item.description}
                </p>
                {item.technologies && item.technologies.length > 0 && (
                  <div
                    className="flex flex-wrap gap-4 sm:gap-6 mb-6 sm:mb-8 justify-center lg:justify-start"
                    style={{ gap: '1.5rem', marginBottom: '2rem' }}
                  >
                    {item.technologies.map((tech, techIndex) => (
                      <span
                        key={techIndex}
                        className="px-4 py-2 bg-accent-500/30 text-accent-200 rounded-full text-sm font-medium border-2 border-accent-500/50 shadow-lg"
                        style={{
                          padding: '0.75rem 1rem',
                          fontSize: '0.875rem',
                        }}
                      >
                        {tech}
                      </span>
                    ))}
                  </div>
                )}
                {item.href && (
                  <button
                    onClick={() => window.open(item.href, '_blank')}
                    className="text-accent-400 hover:text-accent-300 font-medium flex items-center gap-1 group mx-auto lg:mx-0 text-sm sm:text-base"
                  >
                    Learn more
                    <svg
                      className="w-3 h-3 sm:w-4 sm:h-4 transition-transform group-hover:translate-x-1"
                      fill="none"
                      stroke="currentColor"
                      viewBox="0 0 24 24"
                    >
                      <path
                        strokeLinecap="round"
                        strokeLinejoin="round"
                        strokeWidth={2}
                        d="M9 5l7 7-7 7"
                      />
                    </svg>
                  </button>
                )}
              </div>
            </div>
          ))}
        </div>
      </div>
    </section>
  );
};
