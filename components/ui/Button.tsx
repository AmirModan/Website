import React from 'react';
import { ChevronRightIcon, ArrowRightIcon } from '@heroicons/react/24/outline';

interface ButtonProps {
  children: React.ReactNode;
  variant?: 'primary' | 'secondary' | 'ghost';
  size?: 'sm' | 'md' | 'lg';
  icon?: React.ReactNode;
  iconPosition?: 'left' | 'right';
  onClick?: () => void;
  href?: string;
  className?: string;
  disabled?: boolean;
}

export const Button: React.FC<ButtonProps> = ({
  children,
  variant = 'primary',
  size = 'md',
  icon,
  iconPosition = 'right',
  onClick,
  href,
  className = '',
  disabled = false,
}) => {
  const baseClasses = `
    inline-flex items-center justify-center font-semibold rounded-xl
    transition-all duration-200 ease-out
    focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-offset-transparent
    disabled:opacity-50 disabled:cursor-not-allowed
    transform hover:scale-105 active:scale-95
    ${className}
  `;

  const variantClasses = {
    primary: `
      bg-gradient-to-r from-primary-500 to-primary-600
      text-white shadow-lg hover:shadow-xl
      hover:from-primary-600 hover:to-primary-700
      focus:ring-primary-500
    `,
    secondary: `
      glass-morphism text-white border border-white/20
      hover:bg-white/20 hover:border-white/30
      focus:ring-white
    `,
    ghost: `
      text-gray-300 hover:text-white hover:bg-white/10
      focus:ring-white
    `,
  };

  const sizeClasses = {
    sm: 'px-4 py-2 text-sm',
    md: 'px-6 py-3 text-base',
    lg: 'px-8 py-4 text-lg',
  };

  const buttonClasses = `${baseClasses} ${variantClasses[variant]} ${sizeClasses[size]}`;

  const content = (
    <>
      {icon && iconPosition === 'left' && <span className="mr-2">{icon}</span>}
      <span>{children}</span>
      {icon && iconPosition === 'right' && <span className="ml-2">{icon}</span>}
    </>
  );

  if (href) {
    return (
      <a href={href} className={buttonClasses}>
        {content}
      </a>
    );
  }

  return (
    <button className={buttonClasses} onClick={onClick} disabled={disabled}>
      {content}
    </button>
  );
};

export const IconButton: React.FC<{
  icon: React.ReactNode;
  onClick?: () => void;
  variant?: 'primary' | 'secondary' | 'ghost';
  size?: 'sm' | 'md' | 'lg';
  className?: string;
  ariaLabel?: string;
}> = ({
  icon,
  onClick,
  variant = 'secondary',
  size = 'md',
  className = '',
  ariaLabel,
}) => {
  const sizeClasses = {
    sm: 'p-2',
    md: 'p-3',
    lg: 'p-4',
  };

  const variantClasses = {
    primary: 'bg-primary-500 text-white hover:bg-primary-600',
    secondary: 'glass-morphism text-white hover:bg-white/20',
    ghost: 'text-gray-300 hover:text-white hover:bg-white/10',
  };

  return (
    <button
      className={`
        rounded-full transition-all duration-200 transform hover:scale-105 active:scale-95
        ${sizeClasses[size]}
        ${variantClasses[variant]}
        ${className}
      `}
      onClick={onClick}
      aria-label={ariaLabel}
    >
      {icon}
    </button>
  );
};

export const LinkButton: React.FC<{
  href: string;
  children: React.ReactNode;
  external?: boolean;
  variant?: 'primary' | 'secondary';
  size?: 'sm' | 'md' | 'lg';
  className?: string;
}> = ({
  href,
  children,
  external = false,
  variant = 'primary',
  size = 'md',
  className = '',
}) => {
  return (
    <Button
      href={href}
      variant={variant}
      size={size}
      icon={
        external ? (
          <ArrowRightIcon className="w-4 h-4" />
        ) : (
          <ChevronRightIcon className="w-4 h-4" />
        )
      }
      className={className}
    >
      {children}
    </Button>
  );
};
