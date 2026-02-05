import React from 'react';

interface CardProps {
  children: React.ReactNode;
  className?: string;
  hover?: boolean;
  glass?: boolean;
  gradient?: boolean;
  onClick?: () => void;
  as?: 'div' | 'article' | 'section';
}

export const Card: React.FC<CardProps> = ({
  children,
  className = '',
  hover = true,
  glass = true,
  gradient = false,
  onClick,
  as: Component = 'div',
}) => {
  const baseClasses = `
    rounded-2xl p-4 sm:p-6 shadow-xl transition-all duration-300 ease-in-out
    ${glass ? 'glass-morphism hover:backdrop-blur-lg' : ''}
    ${gradient ? 'bg-gradient-to-br from-primary-600/20 to-accent-600/20 backdrop-blur-md' : ''}
    ${hover ? 'cursor-pointer hover:scale-[1.02] hover:shadow-2xl hover:-translate-y-1' : ''}
    ${className}
  `;

  return (
    <Component className={baseClasses} onClick={onClick}>
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
      className={`overflow-hidden ${className}`}
      onClick={() => href && window.open(href, '_blank')}
    >
      <div className="aspect-video sm:aspect-[16/10] lg:aspect-video mb-3 sm:mb-4 overflow-hidden rounded-xl">
        <img
          src={image}
          alt={title}
          className="w-full h-full object-cover transition-transform duration-300 hover:scale-110"
        />
      </div>

      <h3 className="text-lg sm:text-xl font-bold text-white mb-2">{title}</h3>

      <p className="text-sm sm:text-base text-gray-300 mb-3 sm:mb-4 line-clamp-3 leading-relaxed">
        {description}
      </p>

      {technologies.length > 0 && (
        <div className="flex flex-wrap gap-1 sm:gap-2 mb-3 sm:mb-4">
          {technologies.map((tech, index) => (
            <span
              key={index}
              className="px-2 sm:px-3 py-1 bg-primary-500/20 text-primary-300 rounded-full text-xs sm:text-sm font-medium"
            >
              {tech}
            </span>
          ))}
        </div>
      )}

      {href && (
        <button className="text-primary-400 hover:text-primary-300 font-medium flex items-center gap-1 group text-sm sm:text-base">
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
