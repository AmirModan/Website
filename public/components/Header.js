import React from 'react'

export default class Header extends React.Component {
    constructor(props) {
        super();

        this.state = {
            //nav_list: props.nav_list,
            header1: props.header1,
            header2: props.header2,
            header3: props.header3,
            header4: props.header4,
        }
    }

    /*addToHeader(nav_element, nav_label) {
        React.useEffect(() => {
            const para = useEffect.window.document.createElement("a");
            para.setAttribute('href', '#' + nav_element);
            const node = useEffect.document.createTextNode(nav_label);
            para.appendChild(node);
            const d_element = useEffect.document.getElementById("desktop");
            const m_element = useEffect.document.getElementById("mobile");
            d_element.appendChild(para);
            m_element.appendChild(para);
        }, [])
    }*/

    render() {

        //this.state.nav_list.forEach(this.addToHeader);

        return (
            <>
                <header>
                    <div class="content">
                        <a href="/" class="logo"><img src="/Images/Home-Icon.png" height="20" /></a>
                        <nav class="desktop" id="desktop">
                            <a href={"#" + this.state.header4} >{this.state.header4}</a>
                            <a href={"#" + this.state.header3} >{this.state.header3}</a>
                            <a href={"#" + this.state.header2} >{this.state.header2}</a>
                            <a href={"#" + this.state.header1} >{this.state.header1}</a>
                        </nav>
                        <nav class="mobile" id="mobile">
                            <a href={"#" + this.state.header4} >{this.state.header4}</a>
                            <a href={"#" + this.state.header3} >{this.state.header3}</a>
                            <a href={"#" + this.state.header2} >{this.state.header2}</a>
                            <a href={"#" + this.state.header1} >{this.state.header1}</a>
                        </nav>
                    </div>
                </header>
            </>

        )

    }
}