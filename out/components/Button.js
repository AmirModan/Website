import React from 'react'
import styles from '../../public/css/components/Button.module.css'

export default class Button extends React.Component {
    constructor(props) {
        super();

        this.state = {
            opaque: false,
            title: props.title,
            url: props.url,
        }
    }

    render() {
        let opaqueClass = styles.image;
        if (this.state.opaque) {
            opaqueClass = styles.opaque_image;
        } else {
            opaqueClass = styles.image;
        }

        return (
            <>
                <img class={opaqueClass} onPointerEnter={(e) => { this.setState({ opaque: true }) }}
                    onPointerLeave={(e) => { this.setState({ opaque: false }) }} src={this.state.url} />
                <h3>{this.state.title}</h3>
            </>

        )

    }
}