import React from 'react';

interface CardProps {
  children: React.ReactNode;
  className?: string;
  hover?: boolean;
  glass?: boolean;
  gradient?: boolean;
  onClick?: () => void;
  as?: 'div' | 'article' | 'section';
  style?: React.CSSProperties;
}

export const Card: React.FC<CardProps> = ({
  children,
  className = '',
  hover = true,
  glass = true,
  gradient = false,
  onClick,
  as: Component = 'div',
  style,
}) => {
  const baseClasses = `
    rounded-xl p-3 sm:p-4 shadow-lg transition-all duration-300 ease-in-out
    ${glass ? 'glass-morphism hover:backdrop-blur-lg' : ''}
    ${gradient ? 'bg-gradient-to-br from-primary-600/20 to-accent-600/20 backdrop-blur-md' : ''}
    ${hover ? 'cursor-pointer hover:scale-[1.02] hover:shadow-xl hover:-translate-y-1' : ''}
    ${className}
  `;

  return (
    <Component className={baseClasses} onClick={onClick} style={style}>
      {children}
    </Component>
  );
};

interface ProjectCardProps {
  title: string;
  description: string;
  image: string;
  technologies?: string[];
  href?: string;
  className?: string;
}

export const ProjectCard: React.FC<ProjectCardProps> = ({
  title,
  description,
  image,
  technologies = [],
  href,
  className = '',
}) => {
  return (
    <Card
      className={`overflow-hidden h-full project-card text-center ${className}`}
      onClick={() => href && window.open(href, '_blank')}
    >
      <div className="w-full py-4 px-4 overflow-hidden rounded-lg bg-white/5">
        <div className="w-full aspect-[3/2] max-h-24 overflow-hidden rounded">
          <img
            src={image}
            alt={title}
            className="w-full h-full object-contain transition-transform duration-300 hover:scale-105"
          />
        </div>
      </div>

      <h3 className="text-base sm:text-lg font-bold text-white mb-1.5">
        {title}
      </h3>

      <p className="text-xs sm:text-sm text-gray-300 mb-2 sm:mb-3 line-clamp-3 leading-relaxed">
        {description}
      </p>

      {technologies.length > 0 && (
        <div
          className="flex flex-wrap gap-4 sm:gap-6 mb-6 sm:mb-8 justify-center"
          style={{ gap: '1.5rem', marginBottom: '2rem' }}
        >
          {technologies.map((tech, index) => (
            <span
              key={index}
              className="px-4 py-2 bg-primary-500/30 text-primary-200 rounded-full text-sm font-medium border-2 border-primary-500/50 shadow-lg"
              style={{ padding: '0.75rem 1rem', fontSize: '0.875rem' }}
            >
              {tech}
            </span>
          ))}
        </div>
      )}

      {href && (
        <button className="text-primary-400 hover:text-primary-300 font-medium flex items-center gap-1 group text-sm sm:text-base mx-auto">
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
    </Card>
  );
};

interface StatCardProps {
  value: string | number;
  label: string;
  icon?: React.ReactNode;
  trend?: {
    value: number;
    isPositive: boolean;
  };
  className?: string;
}

export const StatCard: React.FC<StatCardProps> = ({
  value,
  label,
  icon,
  trend,
  className = '',
}) => {
  return (
    <Card className={`text-center ${className}`} hover={false}>
      {icon && (
        <div className="flex justify-center mb-3">
          <div className="p-3 bg-primary-500/20 rounded-xl text-primary-400">
            {icon}
          </div>
        </div>
      )}

      <div className="text-3xl font-bold text-white mb-1">{value}</div>

      <div className="text-gray-400 text-sm mb-3">{label}</div>

      {trend && (
        <div
          className={`flex items-center justify-center gap-1 text-sm ${
            trend.isPositive ? 'text-green-400' : 'text-red-400'
          }`}
        >
          <svg
            className="w-4 h-4"
            fill="none"
            stroke="currentColor"
            viewBox="0 0 24 24"
          >
            <path
              strokeLinecap="round"
              strokeLinejoin="round"
              strokeWidth={2}
              d={
                trend.isPositive
                  ? 'M5 10l7-7m0 0l7 7m-7-7v18'
                  : 'M19 14l-7 7m0 0l-7-7m7 7V3'
              }
            />
          </svg>
          {trend.value}%
        </div>
      )}
    </Card>
  );
};
