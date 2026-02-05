import React, { useState, useEffect } from 'react';
import { Bars3Icon, XMarkIcon } from '@heroicons/react/24/outline';
import { Button } from './Button';
import { useRouter } from 'next/router';

const navItems = [
  { name: 'About Me', href: '#aboutMe-section' },
  { name: 'My Research', href: '#research-section' },
  { name: 'My Projects', href: '#projects-section' },
  { name: 'My Resume', href: '#resume-section' },
];

export const Navigation: React.FC = () => {
  const [isOpen, setIsOpen] = useState(false);
  const [scrolled, setScrolled] = useState(false);
  const router = useRouter();

  useEffect(() => {
    const handleScroll = () => {
      setScrolled(window.scrollY > 20);
    };

    window.addEventListener('scroll', handleScroll);
    return () => window.removeEventListener('scroll', handleScroll);
  }, []);

  const handleNavClick = (e: React.MouseEvent, href: string) => {
    e.preventDefault();
    const element = document.querySelector(href);
    if (element) {
      element.scrollIntoView({ behavior: 'smooth' });
    }
    setIsOpen(false);
  };

  const handleLogoClick = (e: React.MouseEvent) => {
    e.preventDefault();
    window.scrollTo({ top: 0, behavior: 'smooth' });
  };

  return (
    <>
      <nav
        className={`
          fixed top-0 left-0 right-0 z-50 transition-all duration-300
          ${scrolled ? 'glass-morphism shadow-lg' : 'bg-transparent'}
        `}
      >
        <div className="section-container">
          <div className="flex items-center justify-between h-12">
            {/* Logo */}
            <a
              href="#aboutMe-section"
              onClick={handleLogoClick}
              className="flex items-center space-x-1.5 sm:space-x-2 group transition-transform hover:scale-102"
            >
              <div className="w-3 h-3 sm:w-3.5 sm:h-3.5 bg-gradient-to-br from-primary-500 to-accent-500 rounded-sm flex items-center justify-center group-hover:shadow-sm transition-shadow">
                <img
                  src="/Images/Home-Icon.png"
                  alt="Home"
                  className="w-1.5 h-1.5 sm:w-2 sm:h-2"
                />
              </div>
              <span className="text-sm sm:text-base font-bold gradient-text hidden sm:block">
                Amir Modan
              </span>
            </a>

            {/* Desktop Navigation */}
            <div className="hidden lg:flex items-center space-x-1">
              {navItems.map((item) => (
                <a
                  key={item.name}
                  href={item.href}
                  onClick={(e) => handleNavClick(e, item.href)}
                  className="nav-link text-sm sm:text-base"
                >
                  {item.name}
                </a>
              ))}
              <Button
                variant="primary"
                size="sm"
                onClick={() => router.push('/contact')}
                className="ml-2 sm:ml-4"
              >
                Contact Me
              </Button>
            </div>

            {/* Tablet Navigation */}
            <div className="hidden md:flex lg:hidden items-center space-x-1">
              {navItems.slice(0, 2).map((item) => (
                <a
                  key={item.name}
                  href={item.href}
                  onClick={(e) => handleNavClick(e, item.href)}
                  className="nav-link text-sm px-3 py-1"
                >
                  {item.name}
                </a>
              ))}
              <Button
                variant="primary"
                size="sm"
                onClick={() => router.push('/contact')}
                className="ml-2"
              >
                Contact
              </Button>
            </div>

            {/* Mobile menu button */}
            <button
              onClick={() => setIsOpen(!isOpen)}
              className="md:hidden p-2 rounded-lg text-gray-300 hover:text-white hover:bg-white/10 transition-colors"
            >
              {isOpen ? (
                <XMarkIcon className="h-3 w-3 sm:h-3.5 sm:w-3.5" />
              ) : (
                <Bars3Icon className="h-3 w-3 sm:h-3.5 sm:w-3.5" />
              )}
            </button>
          </div>
        </div>

        {/* Mobile Navigation */}
        {isOpen && (
          <div className="md:hidden glass-morphism border-t border-white/20 transition-all duration-300">
            <div className="px-4 py-6 space-y-1">
              {navItems.map((item) => (
                <a
                  key={item.name}
                  href={item.href}
                  onClick={(e) => handleNavClick(e, item.href)}
                  className="block px-4 py-3 rounded-lg text-gray-300 hover:text-white hover:bg-white/10 transition-all duration-200 font-medium text-sm"
                >
                  {item.name}
                </a>
              ))}
              <div className="pt-4 border-t border-white/10">
                <Button
                  variant="primary"
                  className="w-full"
                  onClick={() => {
                    router.push('/contact');
                    setIsOpen(false);
                  }}
                >
                  Contact Me
                </Button>
              </div>
            </div>
          </div>
        )}
      </nav>

      {/* Spacer for fixed nav */}
      <div className="h-12" />
    </>
  );
};
