import React, { useState } from 'react'
import styles from '../../public/css/components/Button.module.css'

interface ButtonProps {
    title?: string;
    url: string;
}

export default function Button({ title, url }: ButtonProps) {
    const [opaque, setOpaque] = useState(false);

    const opaqueClass = opaque ? styles.opaque_image : styles.image;

    return (
        <>
            <img 
                className={opaqueClass} 
                onPointerEnter={() => setOpaque(true)}
                onPointerLeave={() => setOpaque(false)} 
                src={url} 
                alt={title || 'Button image'}
            />
            {title && <h3>{title}</h3>}
        </>
    );
}