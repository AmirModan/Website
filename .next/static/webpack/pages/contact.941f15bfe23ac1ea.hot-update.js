"use strict";
/*
 * ATTENTION: An "eval-source-map" devtool has been used.
 * This devtool is neither made for production nor for readable output files.
 * It uses "eval()" calls to create a separate source file with attached SourceMaps in the browser devtools.
 * If you are trying to read the output file, select a different devtool (https://webpack.js.org/configuration/devtool/)
 * or disable the default devtool with "devtool: false".
 * If you are looking for production-ready output files, see mode: "production" (https://webpack.js.org/configuration/mode/).
 */
self["webpackHotUpdate_N_E"]("pages/contact",{

/***/ "./pages/contact.js":
/*!**************************!*\
  !*** ./pages/contact.js ***!
  \**************************/
/***/ (function(module, __webpack_exports__, __webpack_require__) {

eval(__webpack_require__.ts("__webpack_require__.r(__webpack_exports__);\n/* harmony import */ var react_jsx_dev_runtime__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! react/jsx-dev-runtime */ \"./node_modules/react/jsx-dev-runtime.js\");\n/* harmony import */ var react_jsx_dev_runtime__WEBPACK_IMPORTED_MODULE_0___default = /*#__PURE__*/__webpack_require__.n(react_jsx_dev_runtime__WEBPACK_IMPORTED_MODULE_0__);\n/* harmony import */ var next_head__WEBPACK_IMPORTED_MODULE_1__ = __webpack_require__(/*! next/head */ \"./node_modules/next/head.js\");\n/* harmony import */ var next_head__WEBPACK_IMPORTED_MODULE_1___default = /*#__PURE__*/__webpack_require__.n(next_head__WEBPACK_IMPORTED_MODULE_1__);\n/* harmony import */ var _public_components_Header__WEBPACK_IMPORTED_MODULE_2__ = __webpack_require__(/*! ../public/components/Header */ \"./public/components/Header.js\");\n\n\n\nfunction Contact() {\n    async function handleSubmit(event) {\n        event.preventDefault();\n        //call to the Netlify Function you created\n        const response = await fetch(\".netlify/functions/sendEmail\", {\n            method: \"POST\",\n            body: JSON.stringify({\n                message: document.getElementById(\"message\").value,\n                subscriberName: document.getElementById(\"name\").value,\n                subscriberEmail: \"amir5modan@gmail.com\",\n                inviteeEmail: \"amir5modan@gmail.com\"\n            })\n        });\n        if (!response.ok) {\n            const messageStatus = document.getElementById(\"message-status\");\n            messageStatus.innerText = \"Message could not be sent. Please try again later\";\n            messageStatus.style.color = \"red\";\n        //messageStatus.style.background = \"white\"\n        //throw new Error(`HTTP error! status: ${response.status}`);\n        } else {\n            const form = document.getElementById(\"contact-form\");\n            form.reset();\n            const messageStatus = document.getElementById(\"message-status\");\n            messageStatus.innerText = \"Message was sent successfully!\";\n            messageStatus.style.color = \"green\";\n        }\n    }\n    return /*#__PURE__*/ (0,react_jsx_dev_runtime__WEBPACK_IMPORTED_MODULE_0__.jsxDEV)(react_jsx_dev_runtime__WEBPACK_IMPORTED_MODULE_0__.Fragment, {\n        children: [\n            /*#__PURE__*/ (0,react_jsx_dev_runtime__WEBPACK_IMPORTED_MODULE_0__.jsxDEV)((next_head__WEBPACK_IMPORTED_MODULE_1___default()), {\n                children: [\n                    /*#__PURE__*/ (0,react_jsx_dev_runtime__WEBPACK_IMPORTED_MODULE_0__.jsxDEV)(\"title\", {\n                        children: \"Contact Me\"\n                    }, void 0, false, {\n                        fileName: \"C:\\\\Users\\\\admin\\\\Documents\\\\VisualStudioCode\\\\Website\\\\pages\\\\contact.js\",\n                        lineNumber: 36,\n                        columnNumber: 17\n                    }, this),\n                    /*#__PURE__*/ (0,react_jsx_dev_runtime__WEBPACK_IMPORTED_MODULE_0__.jsxDEV)(\"meta\", {\n                        name: \"viewport\",\n                        content: \"width=device-width, initial-scale=1\"\n                    }, void 0, false, {\n                        fileName: \"C:\\\\Users\\\\admin\\\\Documents\\\\VisualStudioCode\\\\Website\\\\pages\\\\contact.js\",\n                        lineNumber: 37,\n                        columnNumber: 17\n                    }, this)\n                ]\n            }, void 0, true, {\n                fileName: \"C:\\\\Users\\\\admin\\\\Documents\\\\VisualStudioCode\\\\Website\\\\pages\\\\contact.js\",\n                lineNumber: 35,\n                columnNumber: 13\n            }, this),\n            /*#__PURE__*/ (0,react_jsx_dev_runtime__WEBPACK_IMPORTED_MODULE_0__.jsxDEV)(_public_components_Header__WEBPACK_IMPORTED_MODULE_2__[\"default\"], {\n                header1: \"Contact Me\"\n            }, void 0, false, {\n                fileName: \"C:\\\\Users\\\\admin\\\\Documents\\\\VisualStudioCode\\\\Website\\\\pages\\\\contact.js\",\n                lineNumber: 39,\n                columnNumber: 13\n            }, this),\n            /*#__PURE__*/ (0,react_jsx_dev_runtime__WEBPACK_IMPORTED_MODULE_0__.jsxDEV)(\"div\", {\n                class: \"main-content\",\n                children: /*#__PURE__*/ (0,react_jsx_dev_runtime__WEBPACK_IMPORTED_MODULE_0__.jsxDEV)(\"div\", {\n                    id: \"projects-section\",\n                    children: [\n                        /*#__PURE__*/ (0,react_jsx_dev_runtime__WEBPACK_IMPORTED_MODULE_0__.jsxDEV)(\"div\", {\n                            className: \"content center\",\n                            children: /*#__PURE__*/ (0,react_jsx_dev_runtime__WEBPACK_IMPORTED_MODULE_0__.jsxDEV)(\"h1\", {\n                                children: \"Contact Me\"\n                            }, void 0, false, {\n                                fileName: \"C:\\\\Users\\\\admin\\\\Documents\\\\VisualStudioCode\\\\Website\\\\pages\\\\contact.js\",\n                                lineNumber: 44,\n                                columnNumber: 25\n                            }, this)\n                        }, void 0, false, {\n                            fileName: \"C:\\\\Users\\\\admin\\\\Documents\\\\VisualStudioCode\\\\Website\\\\pages\\\\contact.js\",\n                            lineNumber: 43,\n                            columnNumber: 21\n                        }, this),\n                        /*#__PURE__*/ (0,react_jsx_dev_runtime__WEBPACK_IMPORTED_MODULE_0__.jsxDEV)(\"div\", {\n                            id: \"Contact-Me\",\n                            class: \"section\",\n                            children: /*#__PURE__*/ (0,react_jsx_dev_runtime__WEBPACK_IMPORTED_MODULE_0__.jsxDEV)(\"div\", {\n                                className: \"center\",\n                                children: /*#__PURE__*/ (0,react_jsx_dev_runtime__WEBPACK_IMPORTED_MODULE_0__.jsxDEV)(\"div\", {\n                                    className: \"subscribe-form-container\",\n                                    children: /*#__PURE__*/ (0,react_jsx_dev_runtime__WEBPACK_IMPORTED_MODULE_0__.jsxDEV)(\"form\", {\n                                        id: \"contact-form\",\n                                        name: \"contact-form\",\n                                        onSubmit: handleSubmit,\n                                        children: [\n                                            /*#__PURE__*/ (0,react_jsx_dev_runtime__WEBPACK_IMPORTED_MODULE_0__.jsxDEV)(\"label\", {\n                                                htmlFor: \"name\",\n                                                children: \"Name\"\n                                            }, void 0, false, {\n                                                fileName: \"C:\\\\Users\\\\admin\\\\Documents\\\\VisualStudioCode\\\\Website\\\\pages\\\\contact.js\",\n                                                lineNumber: 50,\n                                                columnNumber: 37\n                                            }, this),\n                                            /*#__PURE__*/ (0,react_jsx_dev_runtime__WEBPACK_IMPORTED_MODULE_0__.jsxDEV)(\"br\", {}, void 0, false, {\n                                                fileName: \"C:\\\\Users\\\\admin\\\\Documents\\\\VisualStudioCode\\\\Website\\\\pages\\\\contact.js\",\n                                                lineNumber: 51,\n                                                columnNumber: 37\n                                            }, this),\n                                            /*#__PURE__*/ (0,react_jsx_dev_runtime__WEBPACK_IMPORTED_MODULE_0__.jsxDEV)(\"textarea\", {\n                                                id: \"name\",\n                                                name: \"name\",\n                                                rows: \"1\",\n                                                cols: \"50\"\n                                            }, void 0, false, {\n                                                fileName: \"C:\\\\Users\\\\admin\\\\Documents\\\\VisualStudioCode\\\\Website\\\\pages\\\\contact.js\",\n                                                lineNumber: 52,\n                                                columnNumber: 37\n                                            }, this),\n                                            /*#__PURE__*/ (0,react_jsx_dev_runtime__WEBPACK_IMPORTED_MODULE_0__.jsxDEV)(\"br\", {}, void 0, false, {\n                                                fileName: \"C:\\\\Users\\\\admin\\\\Documents\\\\VisualStudioCode\\\\Website\\\\pages\\\\contact.js\",\n                                                lineNumber: 53,\n                                                columnNumber: 37\n                                            }, this),\n                                            /*#__PURE__*/ (0,react_jsx_dev_runtime__WEBPACK_IMPORTED_MODULE_0__.jsxDEV)(\"br\", {}, void 0, false, {\n                                                fileName: \"C:\\\\Users\\\\admin\\\\Documents\\\\VisualStudioCode\\\\Website\\\\pages\\\\contact.js\",\n                                                lineNumber: 53,\n                                                columnNumber: 46\n                                            }, this),\n                                            /*#__PURE__*/ (0,react_jsx_dev_runtime__WEBPACK_IMPORTED_MODULE_0__.jsxDEV)(\"br\", {}, void 0, false, {\n                                                fileName: \"C:\\\\Users\\\\admin\\\\Documents\\\\VisualStudioCode\\\\Website\\\\pages\\\\contact.js\",\n                                                lineNumber: 53,\n                                                columnNumber: 55\n                                            }, this),\n                                            /*#__PURE__*/ (0,react_jsx_dev_runtime__WEBPACK_IMPORTED_MODULE_0__.jsxDEV)(\"label\", {\n                                                htmlFor: \"message\",\n                                                children: \"Message *\"\n                                            }, void 0, false, {\n                                                fileName: \"C:\\\\Users\\\\admin\\\\Documents\\\\VisualStudioCode\\\\Website\\\\pages\\\\contact.js\",\n                                                lineNumber: 54,\n                                                columnNumber: 37\n                                            }, this),\n                                            /*#__PURE__*/ (0,react_jsx_dev_runtime__WEBPACK_IMPORTED_MODULE_0__.jsxDEV)(\"br\", {}, void 0, false, {\n                                                fileName: \"C:\\\\Users\\\\admin\\\\Documents\\\\VisualStudioCode\\\\Website\\\\pages\\\\contact.js\",\n                                                lineNumber: 55,\n                                                columnNumber: 37\n                                            }, this),\n                                            /*#__PURE__*/ (0,react_jsx_dev_runtime__WEBPACK_IMPORTED_MODULE_0__.jsxDEV)(\"textarea\", {\n                                                id: \"message\",\n                                                name: \"message\",\n                                                rows: \"4\",\n                                                cols: \"50\",\n                                                required: true\n                                            }, void 0, false, {\n                                                fileName: \"C:\\\\Users\\\\admin\\\\Documents\\\\VisualStudioCode\\\\Website\\\\pages\\\\contact.js\",\n                                                lineNumber: 56,\n                                                columnNumber: 37\n                                            }, this),\n                                            /*#__PURE__*/ (0,react_jsx_dev_runtime__WEBPACK_IMPORTED_MODULE_0__.jsxDEV)(\"br\", {}, void 0, false, {\n                                                fileName: \"C:\\\\Users\\\\admin\\\\Documents\\\\VisualStudioCode\\\\Website\\\\pages\\\\contact.js\",\n                                                lineNumber: 57,\n                                                columnNumber: 37\n                                            }, this),\n                                            /*#__PURE__*/ (0,react_jsx_dev_runtime__WEBPACK_IMPORTED_MODULE_0__.jsxDEV)(\"p\", {\n                                                id: \"message-status\",\n                                                name: \"message-status\",\n                                                children: \"\\xa0\"\n                                            }, void 0, false, {\n                                                fileName: \"C:\\\\Users\\\\admin\\\\Documents\\\\VisualStudioCode\\\\Website\\\\pages\\\\contact.js\",\n                                                lineNumber: 58,\n                                                columnNumber: 37\n                                            }, this),\n                                            /*#__PURE__*/ (0,react_jsx_dev_runtime__WEBPACK_IMPORTED_MODULE_0__.jsxDEV)(\"br\", {}, void 0, false, {\n                                                fileName: \"C:\\\\Users\\\\admin\\\\Documents\\\\VisualStudioCode\\\\Website\\\\pages\\\\contact.js\",\n                                                lineNumber: 59,\n                                                columnNumber: 37\n                                            }, this),\n                                            /*#__PURE__*/ (0,react_jsx_dev_runtime__WEBPACK_IMPORTED_MODULE_0__.jsxDEV)(\"button\", {\n                                                type: \"submit\",\n                                                children: \"Send Message\"\n                                            }, void 0, false, {\n                                                fileName: \"C:\\\\Users\\\\admin\\\\Documents\\\\VisualStudioCode\\\\Website\\\\pages\\\\contact.js\",\n                                                lineNumber: 60,\n                                                columnNumber: 37\n                                            }, this)\n                                        ]\n                                    }, void 0, true, {\n                                        fileName: \"C:\\\\Users\\\\admin\\\\Documents\\\\VisualStudioCode\\\\Website\\\\pages\\\\contact.js\",\n                                        lineNumber: 49,\n                                        columnNumber: 33\n                                    }, this)\n                                }, void 0, false, {\n                                    fileName: \"C:\\\\Users\\\\admin\\\\Documents\\\\VisualStudioCode\\\\Website\\\\pages\\\\contact.js\",\n                                    lineNumber: 48,\n                                    columnNumber: 29\n                                }, this)\n                            }, void 0, false, {\n                                fileName: \"C:\\\\Users\\\\admin\\\\Documents\\\\VisualStudioCode\\\\Website\\\\pages\\\\contact.js\",\n                                lineNumber: 47,\n                                columnNumber: 25\n                            }, this)\n                        }, void 0, false, {\n                            fileName: \"C:\\\\Users\\\\admin\\\\Documents\\\\VisualStudioCode\\\\Website\\\\pages\\\\contact.js\",\n                            lineNumber: 46,\n                            columnNumber: 21\n                        }, this)\n                    ]\n                }, void 0, true, {\n                    fileName: \"C:\\\\Users\\\\admin\\\\Documents\\\\VisualStudioCode\\\\Website\\\\pages\\\\contact.js\",\n                    lineNumber: 42,\n                    columnNumber: 17\n                }, this)\n            }, void 0, false, {\n                fileName: \"C:\\\\Users\\\\admin\\\\Documents\\\\VisualStudioCode\\\\Website\\\\pages\\\\contact.js\",\n                lineNumber: 41,\n                columnNumber: 13\n            }, this)\n        ]\n    }, void 0, true);\n}\n_c = Contact;\n/* harmony default export */ __webpack_exports__[\"default\"] = (Contact);\nvar _c;\n$RefreshReg$(_c, \"Contact\");\n\n\n;\n    // Wrapped in an IIFE to avoid polluting the global scope\n    ;\n    (function () {\n        var _a, _b;\n        // Legacy CSS implementations will `eval` browser code in a Node.js context\n        // to extract CSS. For backwards compatibility, we need to check we're in a\n        // browser context before continuing.\n        if (typeof self !== 'undefined' &&\n            // AMP / No-JS mode does not inject these helpers:\n            '$RefreshHelpers$' in self) {\n            // @ts-ignore __webpack_module__ is global\n            var currentExports = module.exports;\n            // @ts-ignore __webpack_module__ is global\n            var prevExports = (_b = (_a = module.hot.data) === null || _a === void 0 ? void 0 : _a.prevExports) !== null && _b !== void 0 ? _b : null;\n            // This cannot happen in MainTemplate because the exports mismatch between\n            // templating and execution.\n            self.$RefreshHelpers$.registerExportsForReactRefresh(currentExports, module.id);\n            // A module can be accepted automatically based on its exports, e.g. when\n            // it is a Refresh Boundary.\n            if (self.$RefreshHelpers$.isReactRefreshBoundary(currentExports)) {\n                // Save the previous exports on update so we can compare the boundary\n                // signatures.\n                module.hot.dispose(function (data) {\n                    data.prevExports = currentExports;\n                });\n                // Unconditionally accept an update to this module, we'll check if it's\n                // still a Refresh Boundary later.\n                // @ts-ignore importMeta is replaced in the loader\n                module.hot.accept();\n                // This field is set when the previous version of this module was a\n                // Refresh Boundary, letting us know we need to check for invalidation or\n                // enqueue an update.\n                if (prevExports !== null) {\n                    // A boundary can become ineligible if its exports are incompatible\n                    // with the previous exports.\n                    //\n                    // For example, if you add/remove/change exports, we'll want to\n                    // re-execute the importing modules, and force those components to\n                    // re-render. Similarly, if you convert a class component to a\n                    // function, we want to invalidate the boundary.\n                    if (self.$RefreshHelpers$.shouldInvalidateReactRefreshBoundary(prevExports, currentExports)) {\n                        module.hot.invalidate();\n                    }\n                    else {\n                        self.$RefreshHelpers$.scheduleUpdate();\n                    }\n                }\n            }\n            else {\n                // Since we just executed the code for the module, it's possible that the\n                // new exports made it ineligible for being a boundary.\n                // We only care about the case when we were _previously_ a boundary,\n                // because we already accepted this update (accidental side effect).\n                var isNoLongerABoundary = prevExports !== null;\n                if (isNoLongerABoundary) {\n                    module.hot.invalidate();\n                }\n            }\n        }\n    })();\n//# sourceURL=[module]\n//# sourceMappingURL=data:application/json;charset=utf-8;base64,eyJ2ZXJzaW9uIjozLCJmaWxlIjoiLi9wYWdlcy9jb250YWN0LmpzLmpzIiwibWFwcGluZ3MiOiI7Ozs7Ozs7QUFBNEI7QUFDb0I7QUFFaEQsU0FBU0UsVUFBVTtJQUVmLGVBQWVDLGFBQWFDLEtBQUssRUFBRTtRQUMvQkEsTUFBTUMsY0FBYztRQUNwQiwwQ0FBMEM7UUFDMUMsTUFBTUMsV0FBVyxNQUFNQyxNQUFNLGdDQUFnQztZQUN6REMsUUFBUTtZQUNSQyxNQUFNQyxLQUFLQyxTQUFTLENBQUM7Z0JBQ2pCQyxTQUFTQyxTQUFTQyxjQUFjLENBQUMsV0FBV0MsS0FBSztnQkFDakRDLGdCQUFnQkgsU0FBU0MsY0FBYyxDQUFDLFFBQVFDLEtBQUs7Z0JBQ3JERSxpQkFBaUI7Z0JBQ2pCQyxjQUFjO1lBQ2xCO1FBQ0o7UUFDQSxJQUFJLENBQUNaLFNBQVNhLEVBQUUsRUFBRTtZQUNkLE1BQU1DLGdCQUFnQlAsU0FBU0MsY0FBYyxDQUFDO1lBQzlDTSxjQUFjQyxTQUFTLEdBQUc7WUFDMUJELGNBQWNFLEtBQUssQ0FBQ0MsS0FBSyxHQUFHO1FBQzVCLDBDQUEwQztRQUMxQyw0REFBNEQ7UUFDaEUsT0FBTztZQUNILE1BQU1DLE9BQU9YLFNBQVNDLGNBQWMsQ0FBQztZQUNyQ1UsS0FBS0MsS0FBSztZQUNWLE1BQU1MLGdCQUFnQlAsU0FBU0MsY0FBYyxDQUFDO1lBQzlDTSxjQUFjQyxTQUFTLEdBQUc7WUFDMUJELGNBQWNFLEtBQUssQ0FBQ0MsS0FBSyxHQUFHO1FBQ2hDLENBQUM7SUFDTDtJQUVBLHFCQUNJOzswQkFDSSw4REFBQ3ZCLGtEQUFJQTs7a0NBQ0QsOERBQUMwQjtrQ0FBTTs7Ozs7O2tDQUNQLDhEQUFDQzt3QkFBS0MsTUFBSzt3QkFBV0MsU0FBUTs7Ozs7Ozs7Ozs7OzBCQUVsQyw4REFBQzVCLGlFQUFNQTtnQkFBQzZCLFNBQVE7Ozs7OzswQkFFaEIsOERBQUNDO2dCQUFJQyxPQUFNOzBCQUNQLDRFQUFDRDtvQkFBSUUsSUFBRzs7c0NBQ0osOERBQUNGOzRCQUFJRyxXQUFVO3NDQUNYLDRFQUFDQzswQ0FBRzs7Ozs7Ozs7Ozs7c0NBRVIsOERBQUNKOzRCQUFJRSxJQUFHOzRCQUFhRCxPQUFNO3NDQUN2Qiw0RUFBQ0Q7Z0NBQUlHLFdBQVU7MENBQ1gsNEVBQUNIO29DQUFJRyxXQUFVOzhDQUNYLDRFQUFDVjt3Q0FBS1MsSUFBRzt3Q0FBZUwsTUFBSzt3Q0FBZVEsVUFBVWpDOzswREFDbEQsOERBQUNrQztnREFBTUMsU0FBUTswREFBTzs7Ozs7OzBEQUN0Qiw4REFBQ0M7Ozs7OzBEQUNELDhEQUFDQztnREFBU1AsSUFBRztnREFBT0wsTUFBSztnREFBT2EsTUFBSztnREFBSUMsTUFBSzs7Ozs7OzBEQUM5Qyw4REFBQ0g7Ozs7OzBEQUFRLDhEQUFDQTs7Ozs7MERBQVEsOERBQUNBOzs7OzswREFDbkIsOERBQUNGO2dEQUFNQyxTQUFROzBEQUFVOzs7Ozs7MERBQ3pCLDhEQUFDQzs7Ozs7MERBQ0QsOERBQUNDO2dEQUFTUCxJQUFHO2dEQUFVTCxNQUFLO2dEQUFVYSxNQUFLO2dEQUFJQyxNQUFLO2dEQUFLQyxRQUFROzs7Ozs7MERBQ2pFLDhEQUFDSjs7Ozs7MERBQ0QsOERBQUNLO2dEQUFFWCxJQUFHO2dEQUFpQkwsTUFBSzswREFBaUI7Ozs7OzswREFDN0MsOERBQUNXOzs7OzswREFDRCw4REFBQ007Z0RBQU9DLE1BQUs7MERBQVM7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7QUFZMUQ7S0FwRVM1QztBQXNFVCwrREFBZUEsT0FBT0EsRUFBQSIsInNvdXJjZXMiOlsid2VicGFjazovL19OX0UvLi9wYWdlcy9jb250YWN0LmpzPzRlNzIiXSwic291cmNlc0NvbnRlbnQiOlsiaW1wb3J0IEhlYWQgZnJvbSAnbmV4dC9oZWFkJ1xyXG5pbXBvcnQgSGVhZGVyIGZyb20gJy4uL3B1YmxpYy9jb21wb25lbnRzL0hlYWRlcidcclxuXHJcbmZ1bmN0aW9uIENvbnRhY3QoKSB7XHJcblxyXG4gICAgYXN5bmMgZnVuY3Rpb24gaGFuZGxlU3VibWl0KGV2ZW50KSB7XHJcbiAgICAgICAgZXZlbnQucHJldmVudERlZmF1bHQoKTtcclxuICAgICAgICAvL2NhbGwgdG8gdGhlIE5ldGxpZnkgRnVuY3Rpb24geW91IGNyZWF0ZWRcclxuICAgICAgICBjb25zdCByZXNwb25zZSA9IGF3YWl0IGZldGNoKFwiLm5ldGxpZnkvZnVuY3Rpb25zL3NlbmRFbWFpbFwiLCB7XHJcbiAgICAgICAgICAgIG1ldGhvZDogXCJQT1NUXCIsXHJcbiAgICAgICAgICAgIGJvZHk6IEpTT04uc3RyaW5naWZ5KHtcclxuICAgICAgICAgICAgICAgIG1lc3NhZ2U6IGRvY3VtZW50LmdldEVsZW1lbnRCeUlkKFwibWVzc2FnZVwiKS52YWx1ZSxcclxuICAgICAgICAgICAgICAgIHN1YnNjcmliZXJOYW1lOiBkb2N1bWVudC5nZXRFbGVtZW50QnlJZChcIm5hbWVcIikudmFsdWUsXHJcbiAgICAgICAgICAgICAgICBzdWJzY3JpYmVyRW1haWw6IFwiYW1pcjVtb2RhbkBnbWFpbC5jb21cIiwvL2RvY3VtZW50LmdldEVsZW1lbnRCeUlkKFwiZW1haWxcIikudmFsdWUsXHJcbiAgICAgICAgICAgICAgICBpbnZpdGVlRW1haWw6IFwiYW1pcjVtb2RhbkBnbWFpbC5jb21cIixcclxuICAgICAgICAgICAgfSksXHJcbiAgICAgICAgfSk7XHJcbiAgICAgICAgaWYgKCFyZXNwb25zZS5vaykge1xyXG4gICAgICAgICAgICBjb25zdCBtZXNzYWdlU3RhdHVzID0gZG9jdW1lbnQuZ2V0RWxlbWVudEJ5SWQoXCJtZXNzYWdlLXN0YXR1c1wiKTtcclxuICAgICAgICAgICAgbWVzc2FnZVN0YXR1cy5pbm5lclRleHQgPSBcIk1lc3NhZ2UgY291bGQgbm90IGJlIHNlbnQuIFBsZWFzZSB0cnkgYWdhaW4gbGF0ZXJcIjtcclxuICAgICAgICAgICAgbWVzc2FnZVN0YXR1cy5zdHlsZS5jb2xvciA9IFwicmVkXCJcclxuICAgICAgICAgICAgLy9tZXNzYWdlU3RhdHVzLnN0eWxlLmJhY2tncm91bmQgPSBcIndoaXRlXCJcclxuICAgICAgICAgICAgLy90aHJvdyBuZXcgRXJyb3IoYEhUVFAgZXJyb3IhIHN0YXR1czogJHtyZXNwb25zZS5zdGF0dXN9YCk7XHJcbiAgICAgICAgfSBlbHNlIHtcclxuICAgICAgICAgICAgY29uc3QgZm9ybSA9IGRvY3VtZW50LmdldEVsZW1lbnRCeUlkKFwiY29udGFjdC1mb3JtXCIpO1xyXG4gICAgICAgICAgICBmb3JtLnJlc2V0KCk7XHJcbiAgICAgICAgICAgIGNvbnN0IG1lc3NhZ2VTdGF0dXMgPSBkb2N1bWVudC5nZXRFbGVtZW50QnlJZChcIm1lc3NhZ2Utc3RhdHVzXCIpO1xyXG4gICAgICAgICAgICBtZXNzYWdlU3RhdHVzLmlubmVyVGV4dCA9IFwiTWVzc2FnZSB3YXMgc2VudCBzdWNjZXNzZnVsbHkhXCI7XHJcbiAgICAgICAgICAgIG1lc3NhZ2VTdGF0dXMuc3R5bGUuY29sb3IgPSBcImdyZWVuXCJcclxuICAgICAgICB9XHJcbiAgICB9XHJcblxyXG4gICAgcmV0dXJuIChcclxuICAgICAgICA8PlxyXG4gICAgICAgICAgICA8SGVhZD5cclxuICAgICAgICAgICAgICAgIDx0aXRsZT5Db250YWN0IE1lPC90aXRsZT5cclxuICAgICAgICAgICAgICAgIDxtZXRhIG5hbWU9XCJ2aWV3cG9ydFwiIGNvbnRlbnQ9XCJ3aWR0aD1kZXZpY2Utd2lkdGgsIGluaXRpYWwtc2NhbGU9MVwiIC8+XHJcbiAgICAgICAgICAgIDwvSGVhZD5cclxuICAgICAgICAgICAgPEhlYWRlciBoZWFkZXIxPVwiQ29udGFjdCBNZVwiIC8+XHJcbiAgICAgICAgICAgIFxyXG4gICAgICAgICAgICA8ZGl2IGNsYXNzPVwibWFpbi1jb250ZW50XCI+XHJcbiAgICAgICAgICAgICAgICA8ZGl2IGlkPVwicHJvamVjdHMtc2VjdGlvblwiPlxyXG4gICAgICAgICAgICAgICAgICAgIDxkaXYgY2xhc3NOYW1lPVwiY29udGVudCBjZW50ZXJcIj5cclxuICAgICAgICAgICAgICAgICAgICAgICAgPGgxPkNvbnRhY3QgTWU8L2gxPlxyXG4gICAgICAgICAgICAgICAgICAgIDwvZGl2PlxyXG4gICAgICAgICAgICAgICAgICAgIDxkaXYgaWQ9XCJDb250YWN0LU1lXCIgY2xhc3M9XCJzZWN0aW9uXCI+XHJcbiAgICAgICAgICAgICAgICAgICAgICAgIDxkaXYgY2xhc3NOYW1lPVwiY2VudGVyXCI+XHJcbiAgICAgICAgICAgICAgICAgICAgICAgICAgICA8ZGl2IGNsYXNzTmFtZT1cInN1YnNjcmliZS1mb3JtLWNvbnRhaW5lclwiPlxyXG4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDxmb3JtIGlkPVwiY29udGFjdC1mb3JtXCIgbmFtZT1cImNvbnRhY3QtZm9ybVwiIG9uU3VibWl0PXtoYW5kbGVTdWJtaXR9PlxyXG4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA8bGFiZWwgaHRtbEZvcj1cIm5hbWVcIj5OYW1lPC9sYWJlbD5cclxuICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPGJyPjwvYnI+XHJcbiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDx0ZXh0YXJlYSBpZD1cIm5hbWVcIiBuYW1lPVwibmFtZVwiIHJvd3M9XCIxXCIgY29scz1cIjUwXCIgLz5cclxuICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPGJyPjwvYnI+PGJyPjwvYnI+PGJyPjwvYnI+XHJcbiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDxsYWJlbCBodG1sRm9yPVwibWVzc2FnZVwiPk1lc3NhZ2UgKjwvbGFiZWw+XHJcbiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDxicj48L2JyPlxyXG4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA8dGV4dGFyZWEgaWQ9XCJtZXNzYWdlXCIgbmFtZT1cIm1lc3NhZ2VcIiByb3dzPVwiNFwiIGNvbHM9XCI1MFwiIHJlcXVpcmVkPjwvdGV4dGFyZWE+XHJcbiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDxicj48L2JyPlxyXG4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA8cCBpZD1cIm1lc3NhZ2Utc3RhdHVzXCIgbmFtZT1cIm1lc3NhZ2Utc3RhdHVzXCI+Jm5ic3A7PC9wPlxyXG4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA8YnI+PC9icj5cclxuICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPGJ1dHRvbiB0eXBlPVwic3VibWl0XCI+U2VuZCBNZXNzYWdlPC9idXR0b24+XHJcbiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPC9mb3JtPlxyXG4gICAgICAgICAgICAgICAgICAgICAgICAgICAgPC9kaXY+XHJcblxyXG4gICAgICAgICAgICAgICAgICAgICAgICA8L2Rpdj5cclxuICAgICAgICAgICAgICAgICAgICA8L2Rpdj5cclxuXHJcbiAgICAgICAgICAgICAgICA8L2Rpdj5cclxuICAgICAgICAgICAgPC9kaXY+XHJcblxyXG4gICAgICAgIDwvPlxyXG4gICAgKTtcclxufVxyXG5cclxuZXhwb3J0IGRlZmF1bHQgQ29udGFjdCJdLCJuYW1lcyI6WyJIZWFkIiwiSGVhZGVyIiwiQ29udGFjdCIsImhhbmRsZVN1Ym1pdCIsImV2ZW50IiwicHJldmVudERlZmF1bHQiLCJyZXNwb25zZSIsImZldGNoIiwibWV0aG9kIiwiYm9keSIsIkpTT04iLCJzdHJpbmdpZnkiLCJtZXNzYWdlIiwiZG9jdW1lbnQiLCJnZXRFbGVtZW50QnlJZCIsInZhbHVlIiwic3Vic2NyaWJlck5hbWUiLCJzdWJzY3JpYmVyRW1haWwiLCJpbnZpdGVlRW1haWwiLCJvayIsIm1lc3NhZ2VTdGF0dXMiLCJpbm5lclRleHQiLCJzdHlsZSIsImNvbG9yIiwiZm9ybSIsInJlc2V0IiwidGl0bGUiLCJtZXRhIiwibmFtZSIsImNvbnRlbnQiLCJoZWFkZXIxIiwiZGl2IiwiY2xhc3MiLCJpZCIsImNsYXNzTmFtZSIsImgxIiwib25TdWJtaXQiLCJsYWJlbCIsImh0bWxGb3IiLCJiciIsInRleHRhcmVhIiwicm93cyIsImNvbHMiLCJyZXF1aXJlZCIsInAiLCJidXR0b24iLCJ0eXBlIl0sInNvdXJjZVJvb3QiOiIifQ==\n//# sourceURL=webpack-internal:///./pages/contact.js\n"));

/***/ })

});