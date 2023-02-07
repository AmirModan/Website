"use strict";
exports.id = 881;
exports.ids = [881];
exports.modules = {

/***/ 881:
/***/ ((__unused_webpack_module, __webpack_exports__, __webpack_require__) => {

/* harmony export */ __webpack_require__.d(__webpack_exports__, {
/* harmony export */   "Z": () => (/* binding */ Header)
/* harmony export */ });
/* harmony import */ var react_jsx_runtime__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(997);
/* harmony import */ var react_jsx_runtime__WEBPACK_IMPORTED_MODULE_0___default = /*#__PURE__*/__webpack_require__.n(react_jsx_runtime__WEBPACK_IMPORTED_MODULE_0__);
/* harmony import */ var react__WEBPACK_IMPORTED_MODULE_1__ = __webpack_require__(689);
/* harmony import */ var react__WEBPACK_IMPORTED_MODULE_1___default = /*#__PURE__*/__webpack_require__.n(react__WEBPACK_IMPORTED_MODULE_1__);


class Header extends (react__WEBPACK_IMPORTED_MODULE_1___default().Component) {
    constructor(props){
        super();
        this.state = {
            //nav_list: props.nav_list,
            header1: props.header1,
            header2: props.header2,
            header3: props.header3,
            header4: props.header4
        };
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
    }*/ render() {
        //this.state.nav_list.forEach(this.addToHeader);
        return /*#__PURE__*/ react_jsx_runtime__WEBPACK_IMPORTED_MODULE_0__.jsx(react_jsx_runtime__WEBPACK_IMPORTED_MODULE_0__.Fragment, {
            children: /*#__PURE__*/ react_jsx_runtime__WEBPACK_IMPORTED_MODULE_0__.jsx("header", {
                children: /*#__PURE__*/ (0,react_jsx_runtime__WEBPACK_IMPORTED_MODULE_0__.jsxs)("div", {
                    class: "content",
                    children: [
                        /*#__PURE__*/ react_jsx_runtime__WEBPACK_IMPORTED_MODULE_0__.jsx("a", {
                            href: "/",
                            class: "logo",
                            children: /*#__PURE__*/ react_jsx_runtime__WEBPACK_IMPORTED_MODULE_0__.jsx("img", {
                                src: "/Images/Home-Icon.png",
                                height: "20"
                            })
                        }),
                        /*#__PURE__*/ (0,react_jsx_runtime__WEBPACK_IMPORTED_MODULE_0__.jsxs)("nav", {
                            class: "desktop",
                            id: "desktop",
                            children: [
                                /*#__PURE__*/ react_jsx_runtime__WEBPACK_IMPORTED_MODULE_0__.jsx("a", {
                                    href: "#" + this.state.header4,
                                    children: this.state.header4
                                }),
                                /*#__PURE__*/ react_jsx_runtime__WEBPACK_IMPORTED_MODULE_0__.jsx("a", {
                                    href: "#" + this.state.header3,
                                    children: this.state.header3
                                }),
                                /*#__PURE__*/ react_jsx_runtime__WEBPACK_IMPORTED_MODULE_0__.jsx("a", {
                                    href: "#" + this.state.header2,
                                    children: this.state.header2
                                }),
                                /*#__PURE__*/ react_jsx_runtime__WEBPACK_IMPORTED_MODULE_0__.jsx("a", {
                                    href: "#" + this.state.header1,
                                    children: this.state.header1
                                })
                            ]
                        }),
                        /*#__PURE__*/ (0,react_jsx_runtime__WEBPACK_IMPORTED_MODULE_0__.jsxs)("nav", {
                            class: "mobile",
                            id: "mobile",
                            children: [
                                /*#__PURE__*/ react_jsx_runtime__WEBPACK_IMPORTED_MODULE_0__.jsx("a", {
                                    href: "#" + this.state.header4,
                                    children: this.state.header4
                                }),
                                /*#__PURE__*/ react_jsx_runtime__WEBPACK_IMPORTED_MODULE_0__.jsx("a", {
                                    href: "#" + this.state.header3,
                                    children: this.state.header3
                                }),
                                /*#__PURE__*/ react_jsx_runtime__WEBPACK_IMPORTED_MODULE_0__.jsx("a", {
                                    href: "#" + this.state.header2,
                                    children: this.state.header2
                                }),
                                /*#__PURE__*/ react_jsx_runtime__WEBPACK_IMPORTED_MODULE_0__.jsx("a", {
                                    href: "#" + this.state.header1,
                                    children: this.state.header1
                                })
                            ]
                        })
                    ]
                })
            })
        });
    }
}


/***/ })

};
;