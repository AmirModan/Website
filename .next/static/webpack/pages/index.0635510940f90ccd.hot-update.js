"use strict";
/*
 * ATTENTION: An "eval-source-map" devtool has been used.
 * This devtool is neither made for production nor for readable output files.
 * It uses "eval()" calls to create a separate source file with attached SourceMaps in the browser devtools.
 * If you are trying to read the output file, select a different devtool (https://webpack.js.org/configuration/devtool/)
 * or disable the default devtool with "devtool: false".
 * If you are looking for production-ready output files, see mode: "production" (https://webpack.js.org/configuration/mode/).
 */
self["webpackHotUpdate_N_E"]("pages/index",{

/***/ "./pages/index.js":
/*!************************!*\
  !*** ./pages/index.js ***!
  \************************/
/***/ (function(module, __webpack_exports__, __webpack_require__) {

eval(__webpack_require__.ts("__webpack_require__.r(__webpack_exports__);\n/* harmony import */ var react_jsx_dev_runtime__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! react/jsx-dev-runtime */ \"./node_modules/react/jsx-dev-runtime.js\");\n/* harmony import */ var react_jsx_dev_runtime__WEBPACK_IMPORTED_MODULE_0___default = /*#__PURE__*/__webpack_require__.n(react_jsx_dev_runtime__WEBPACK_IMPORTED_MODULE_0__);\n/* harmony import */ var next_head__WEBPACK_IMPORTED_MODULE_1__ = __webpack_require__(/*! next/head */ \"./node_modules/next/head.js\");\n/* harmony import */ var next_head__WEBPACK_IMPORTED_MODULE_1___default = /*#__PURE__*/__webpack_require__.n(next_head__WEBPACK_IMPORTED_MODULE_1__);\n\n\nfunction Home() {\n    return /*#__PURE__*/ (0,react_jsx_dev_runtime__WEBPACK_IMPORTED_MODULE_0__.jsxDEV)(react_jsx_dev_runtime__WEBPACK_IMPORTED_MODULE_0__.Fragment, {\n        children: [\n            /*#__PURE__*/ (0,react_jsx_dev_runtime__WEBPACK_IMPORTED_MODULE_0__.jsxDEV)((next_head__WEBPACK_IMPORTED_MODULE_1___default()), {\n                children: [\n                    /*#__PURE__*/ (0,react_jsx_dev_runtime__WEBPACK_IMPORTED_MODULE_0__.jsxDEV)(\"title\", {\n                        children: \"My Home\"\n                    }, void 0, false, {\n                        fileName: \"C:\\\\Users\\\\admin\\\\Documents\\\\VisualStudioCode\\\\Website\\\\pages\\\\index.js\",\n                        lineNumber: 8,\n                        columnNumber: 17\n                    }, this),\n                    /*#__PURE__*/ (0,react_jsx_dev_runtime__WEBPACK_IMPORTED_MODULE_0__.jsxDEV)(\"meta\", {\n                        name: \"viewport\"\n                    }, void 0, false, {\n                        fileName: \"C:\\\\Users\\\\admin\\\\Documents\\\\VisualStudioCode\\\\Website\\\\pages\\\\index.js\",\n                        lineNumber: 9,\n                        columnNumber: 17\n                    }, this)\n                ]\n            }, void 0, true, {\n                fileName: \"C:\\\\Users\\\\admin\\\\Documents\\\\VisualStudioCode\\\\Website\\\\pages\\\\index.js\",\n                lineNumber: 7,\n                columnNumber: 13\n            }, this),\n            /*#__PURE__*/ (0,react_jsx_dev_runtime__WEBPACK_IMPORTED_MODULE_0__.jsxDEV)(\"div\", {\n                children: \"Welcome, Explorer!\"\n            }, void 0, false, {\n                fileName: \"C:\\\\Users\\\\admin\\\\Documents\\\\VisualStudioCode\\\\Website\\\\pages\\\\index.js\",\n                lineNumber: 11,\n                columnNumber: 13\n            }, this),\n            /*#__PURE__*/ (0,react_jsx_dev_runtime__WEBPACK_IMPORTED_MODULE_0__.jsxDEV)(\"button\", {\n                onClick: handleClick,\n                children: \"Click me!\"\n            }, void 0, false, {\n                fileName: \"C:\\\\Users\\\\admin\\\\Documents\\\\VisualStudioCode\\\\Website\\\\pages\\\\index.js\",\n                lineNumber: 12,\n                columnNumber: 13\n            }, this)\n        ]\n    }, void 0, true);\n}\n_c = Home;\nasync function handleClick(e) {\n    e.preventDefault();\n    await fetch(\".netlify/functions/subscribe\", {\n        method: \"POST\",\n        body: JSON.stringify({\n            subscriberName: \"amir5modan@gmail.com\",\n            subscriberEmail: \"amir5modan@gmail.com\",\n            inviteeEmail: \"amir5modan@gmail.com\"\n        })\n    });\n}\n/* harmony default export */ __webpack_exports__[\"default\"] = (Home);\nvar _c;\n$RefreshReg$(_c, \"Home\");\n\n\n;\n    // Wrapped in an IIFE to avoid polluting the global scope\n    ;\n    (function () {\n        var _a, _b;\n        // Legacy CSS implementations will `eval` browser code in a Node.js context\n        // to extract CSS. For backwards compatibility, we need to check we're in a\n        // browser context before continuing.\n        if (typeof self !== 'undefined' &&\n            // AMP / No-JS mode does not inject these helpers:\n            '$RefreshHelpers$' in self) {\n            // @ts-ignore __webpack_module__ is global\n            var currentExports = module.exports;\n            // @ts-ignore __webpack_module__ is global\n            var prevExports = (_b = (_a = module.hot.data) === null || _a === void 0 ? void 0 : _a.prevExports) !== null && _b !== void 0 ? _b : null;\n            // This cannot happen in MainTemplate because the exports mismatch between\n            // templating and execution.\n            self.$RefreshHelpers$.registerExportsForReactRefresh(currentExports, module.id);\n            // A module can be accepted automatically based on its exports, e.g. when\n            // it is a Refresh Boundary.\n            if (self.$RefreshHelpers$.isReactRefreshBoundary(currentExports)) {\n                // Save the previous exports on update so we can compare the boundary\n                // signatures.\n                module.hot.dispose(function (data) {\n                    data.prevExports = currentExports;\n                });\n                // Unconditionally accept an update to this module, we'll check if it's\n                // still a Refresh Boundary later.\n                // @ts-ignore importMeta is replaced in the loader\n                module.hot.accept();\n                // This field is set when the previous version of this module was a\n                // Refresh Boundary, letting us know we need to check for invalidation or\n                // enqueue an update.\n                if (prevExports !== null) {\n                    // A boundary can become ineligible if its exports are incompatible\n                    // with the previous exports.\n                    //\n                    // For example, if you add/remove/change exports, we'll want to\n                    // re-execute the importing modules, and force those components to\n                    // re-render. Similarly, if you convert a class component to a\n                    // function, we want to invalidate the boundary.\n                    if (self.$RefreshHelpers$.shouldInvalidateReactRefreshBoundary(prevExports, currentExports)) {\n                        module.hot.invalidate();\n                    }\n                    else {\n                        self.$RefreshHelpers$.scheduleUpdate();\n                    }\n                }\n            }\n            else {\n                // Since we just executed the code for the module, it's possible that the\n                // new exports made it ineligible for being a boundary.\n                // We only care about the case when we were _previously_ a boundary,\n                // because we already accepted this update (accidental side effect).\n                var isNoLongerABoundary = prevExports !== null;\n                if (isNoLongerABoundary) {\n                    module.hot.invalidate();\n                }\n            }\n        }\n    })();\n//# sourceURL=[module]\n//# sourceMappingURL=data:application/json;charset=utf-8;base64,eyJ2ZXJzaW9uIjozLCJmaWxlIjoiLi9wYWdlcy9pbmRleC5qcy5qcyIsIm1hcHBpbmdzIjoiOzs7Ozs7QUFBNEI7QUFFNUIsU0FBU0MsT0FBTztJQUVaLHFCQUNJOzswQkFDSSw4REFBQ0Qsa0RBQUlBOztrQ0FDRCw4REFBQ0U7a0NBQU07Ozs7OztrQ0FDUCw4REFBQ0M7d0JBQUtDLE1BQUs7Ozs7Ozs7Ozs7OzswQkFFZiw4REFBQ0M7MEJBQUk7Ozs7OzswQkFDTCw4REFBQ0M7Z0JBQU9DLFNBQVNDOzBCQUFhOzs7Ozs7OztBQUcxQztLQVpTUDtBQWNULGVBQWVPLFlBQWFDLENBQUMsRUFBRTtJQUMzQkEsRUFBRUMsY0FBYztJQUNoQixNQUFNQyxNQUNELGdDQUNEO1FBQ0VDLFFBQVE7UUFDUkMsTUFBTUMsS0FBS0MsU0FBUyxDQUFDO1lBQ25CQyxnQkFBZ0I7WUFDaEJDLGlCQUFpQjtZQUNqQkMsY0FBYztRQUNoQjtJQUNGO0FBRVI7QUFDQSwrREFBZWpCLElBQUlBLEVBQUEiLCJzb3VyY2VzIjpbIndlYnBhY2s6Ly9fTl9FLy4vcGFnZXMvaW5kZXguanM/YmVlNyJdLCJzb3VyY2VzQ29udGVudCI6WyJpbXBvcnQgSGVhZCBmcm9tICduZXh0L2hlYWQnXHJcblxyXG5mdW5jdGlvbiBIb21lKCkge1xyXG5cclxuICAgIHJldHVybiAoXHJcbiAgICAgICAgPD5cclxuICAgICAgICAgICAgPEhlYWQ+XHJcbiAgICAgICAgICAgICAgICA8dGl0bGU+TXkgSG9tZTwvdGl0bGU+XHJcbiAgICAgICAgICAgICAgICA8bWV0YSBuYW1lPVwidmlld3BvcnRcIiAvPlxyXG4gICAgICAgICAgICA8L0hlYWQ+XHJcbiAgICAgICAgICAgIDxkaXY+V2VsY29tZSwgRXhwbG9yZXIhPC9kaXY+XHJcbiAgICAgICAgICAgIDxidXR0b24gb25DbGljaz17aGFuZGxlQ2xpY2t9PkNsaWNrIG1lITwvYnV0dG9uPlxyXG4gICAgICAgIDwvPlxyXG4gICAgKVxyXG59XHJcblxyXG5hc3luYyBmdW5jdGlvbiBoYW5kbGVDbGljayAoZSkge1xyXG4gICAgZS5wcmV2ZW50RGVmYXVsdCgpXHJcbiAgICBhd2FpdCBmZXRjaChcclxuICAgICAgICBgLm5ldGxpZnkvZnVuY3Rpb25zL3N1YnNjcmliZWAsXHJcbiAgICAgICAge1xyXG4gICAgICAgICAgbWV0aG9kOiBcIlBPU1RcIixcclxuICAgICAgICAgIGJvZHk6IEpTT04uc3RyaW5naWZ5KHtcclxuICAgICAgICAgICAgc3Vic2NyaWJlck5hbWU6IFwiYW1pcjVtb2RhbkBnbWFpbC5jb21cIixcclxuICAgICAgICAgICAgc3Vic2NyaWJlckVtYWlsOiBcImFtaXI1bW9kYW5AZ21haWwuY29tXCIsXHJcbiAgICAgICAgICAgIGludml0ZWVFbWFpbDogXCJhbWlyNW1vZGFuQGdtYWlsLmNvbVwiLFxyXG4gICAgICAgICAgfSksXHJcbiAgICAgICAgfVxyXG4gICAgICApO1xyXG59XHJcbmV4cG9ydCBkZWZhdWx0IEhvbWUiXSwibmFtZXMiOlsiSGVhZCIsIkhvbWUiLCJ0aXRsZSIsIm1ldGEiLCJuYW1lIiwiZGl2IiwiYnV0dG9uIiwib25DbGljayIsImhhbmRsZUNsaWNrIiwiZSIsInByZXZlbnREZWZhdWx0IiwiZmV0Y2giLCJtZXRob2QiLCJib2R5IiwiSlNPTiIsInN0cmluZ2lmeSIsInN1YnNjcmliZXJOYW1lIiwic3Vic2NyaWJlckVtYWlsIiwiaW52aXRlZUVtYWlsIl0sInNvdXJjZVJvb3QiOiIifQ==\n//# sourceURL=webpack-internal:///./pages/index.js\n"));

/***/ })

});