import React from 'react';
import { Card } from '../ui/Card';
import { Button } from '../ui/Button';
import {
  ArrowRightIcon,
  PlayIcon,
  DocumentTextIcon,
} from '@heroicons/react/24/outline';

interface HeroSectionProps {
  title?: string;
  subtitle?: string;
  description?: string;
  ctaText?: string;
  secondaryCtaText?: string;
  backgroundImage?: string;
  onPrimaryClick?: () => void;
  onSecondaryClick?: () => void;
}

export const HeroSection: React.FC<HeroSectionProps> = ({
  title = "Hi, I'm Amir Modan",
  subtitle = 'Computer Engineering Graduate',
  description = 'Passionate about creating innovative solutions through cutting-edge technology. Specializing in machine learning, embedded systems, and full-stack development.',
  ctaText = 'View My Work',
  secondaryCtaText = 'Contact Me',
  backgroundImage,
  onPrimaryClick,
  onSecondaryClick,
}) => {
  return (
    <section className="relative min-h-screen flex items-center justify-center overflow-hidden">
      {/* Background gradient and effects */}
      <div className="absolute inset-0 bg-gradient-to-br from-primary-900/20 via-transparent to-accent-900/20" />
      <div className="absolute inset-0">
        <div className="absolute top-1/4 left-1/4 w-96 h-96 bg-primary-500/20 rounded-full blur-3xl animate-pulse-slow" />
        <div
          className="absolute bottom-1/4 right-1/4 w-96 h-96 bg-accent-500/20 rounded-full blur-3xl animate-pulse-slow"
          style={{ animationDelay: '2s' }}
        />
      </div>

      <div className="relative z-10 section-container">
        <div className="text-center max-w-4xl mx-auto">
          {/* Profile Image */}
          <div className="mb-8">
            <div className="relative inline-block">
              <div className="absolute inset-0 bg-gradient-to-r from-primary-500 to-accent-500 rounded-full blur-lg opacity-60 animate-glow" />
              <img
                src="/Images/Profile.jpg"
                alt="Amir Modan"
                className="relative w-32 h-32 md:w-40 md:h-40 rounded-full border-4 border-white/20 shadow-2xl object-cover"
              />
            </div>
          </div>

          {/* Title */}
          <h1 className="text-5xl md:text-7xl font-bold mb-6 animate-fade-in">
            <span className="gradient-text">{title}</span>
          </h1>

          {/* Subtitle */}
          <h2
            className="text-2xl md:text-3xl text-gray-300 mb-6 animate-fade-in"
            style={{ animationDelay: '0.2s' }}
          >
            {subtitle}
          </h2>

          {/* Description */}
          <p
            className="text-lg md:text-xl text-gray-400 mb-12 max-w-3xl mx-auto leading-relaxed animate-fade-in"
            style={{ animationDelay: '0.3s' }}
          >
            {description}
          </p>

          {/* CTA Buttons */}
          <div
            className="flex flex-col sm:flex-row gap-4 justify-center items-center animate-fade-in"
            style={{ animationDelay: '0.4s' }}
          >
            <Button
              variant="primary"
              size="lg"
              onClick={onPrimaryClick}
              icon={<ArrowRightIcon className="w-5 h-5" />}
            >
              {ctaText}
            </Button>
            <Button
              variant="secondary"
              size="lg"
              onClick={onSecondaryClick}
              icon={<DocumentTextIcon className="w-5 h-5" />}
            >
              {secondaryCtaText}
            </Button>
          </div>

          {/* Social Links */}
          <div
            className="mt-12 flex justify-center items-center gap-6 animate-fade-in"
            style={{ animationDelay: '0.5s' }}
          >
            <a
              href="https://github.com/AmirModan"
              target="_blank"
              rel="noopener noreferrer"
              className="text-gray-400 hover:text-white transition-colors transform hover:scale-110 hover:rotate-5"
            >
              <img
                src="/Images/GitHub-logo.png"
                alt="GitHub"
                className="w-8 h-8"
              />
            </a>
            <a
              href="https://www.linkedin.com/in/amir-modan-8320b0194"
              target="_blank"
              rel="noopener noreferrer"
              className="text-gray-400 hover:text-white transition-colors transform hover:scale-110 hover:-rotate-5"
            >
              <img
                src="/Images/LinkedIn-Logo.jpg"
                alt="LinkedIn"
                className="w-8 h-8 rounded"
              />
            </a>
          </div>
        </div>
      </div>

      {/* Scroll indicator */}
      <div className="absolute bottom-8 left-1/2 transform -translate-x-1/2">
        <div className="text-gray-400 animate-bounce-soft">
          <svg
            className="w-6 h-6"
            fill="none"
            stroke="currentColor"
            viewBox="0 0 24 24"
          >
            <path
              strokeLinecap="round"
              strokeLinejoin="round"
              strokeWidth={2}
              d="M19 14l-7 7m0 0l-7-7m7 7V3"
            />
          </svg>
        </div>
      </div>
    </section>
  );
};
