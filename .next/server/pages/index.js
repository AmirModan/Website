"use strict";
/*
 * ATTENTION: An "eval-source-map" devtool has been used.
 * This devtool is neither made for production nor for readable output files.
 * It uses "eval()" calls to create a separate source file with attached SourceMaps in the browser devtools.
 * If you are trying to read the output file, select a different devtool (https://webpack.js.org/configuration/devtool/)
 * or disable the default devtool with "devtool: false".
 * If you are looking for production-ready output files, see mode: "production" (https://webpack.js.org/configuration/mode/).
 */
(() => {
var exports = {};
exports.id = "pages/index";
exports.ids = ["pages/index"];
exports.modules = {

/***/ "./pages/index.tsx":
/*!*************************!*\
  !*** ./pages/index.tsx ***!
  \*************************/
/***/ ((__unused_webpack_module, __webpack_exports__, __webpack_require__) => {

eval("__webpack_require__.r(__webpack_exports__);\n/* harmony export */ __webpack_require__.d(__webpack_exports__, {\n/* harmony export */   \"default\": () => (/* binding */ Subscribe)\n/* harmony export */ });\n/* harmony import */ var react_jsx_dev_runtime__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! react/jsx-dev-runtime */ \"react/jsx-dev-runtime\");\n/* harmony import */ var react_jsx_dev_runtime__WEBPACK_IMPORTED_MODULE_0___default = /*#__PURE__*/__webpack_require__.n(react_jsx_dev_runtime__WEBPACK_IMPORTED_MODULE_0__);\n/* harmony import */ var react__WEBPACK_IMPORTED_MODULE_1__ = __webpack_require__(/*! react */ \"react\");\n/* harmony import */ var react__WEBPACK_IMPORTED_MODULE_1___default = /*#__PURE__*/__webpack_require__.n(react__WEBPACK_IMPORTED_MODULE_1__);\n\n\nfunction Subscribe() {\n    const handleSubmit = async (event)=>{\n        event.preventDefault();\n        const target = event.target;\n        const data = {\n            subscriberName: target.name,\n            subscriberEmail: target.email\n        };\n        //call to the Netlify Function you created\n        fetch(\"./.netlify/functions/email\", {\n            method: \"POST\",\n            body: JSON.stringify({\n                subscriberName: data.subscriberName,\n                subscriberEmail: data.subscriberEmail,\n                inviteeEmail: \"amir5modan@gmail.com\"\n            })\n        });\n    };\n    return /*#__PURE__*/ (0,react_jsx_dev_runtime__WEBPACK_IMPORTED_MODULE_0__.jsxDEV)(\"div\", {\n        className: \"subscribe-form-container\",\n        children: /*#__PURE__*/ (0,react_jsx_dev_runtime__WEBPACK_IMPORTED_MODULE_0__.jsxDEV)(\"form\", {\n            onSubmit: handleSubmit,\n            children: [\n                /*#__PURE__*/ (0,react_jsx_dev_runtime__WEBPACK_IMPORTED_MODULE_0__.jsxDEV)(\"label\", {\n                    htmlFor: \"name\",\n                    children: \"Name\"\n                }, void 0, false, {\n                    fileName: \"C:\\\\Users\\\\admin\\\\Documents\\\\VisualStudioCode\\\\Website\\\\pages\\\\index.tsx\",\n                    lineNumber: 27,\n                    columnNumber: 9\n                }, this),\n                /*#__PURE__*/ (0,react_jsx_dev_runtime__WEBPACK_IMPORTED_MODULE_0__.jsxDEV)(\"input\", {\n                    type: \"text\",\n                    id: \"name\",\n                    name: \"name\",\n                    required: true\n                }, void 0, false, {\n                    fileName: \"C:\\\\Users\\\\admin\\\\Documents\\\\VisualStudioCode\\\\Website\\\\pages\\\\index.tsx\",\n                    lineNumber: 28,\n                    columnNumber: 9\n                }, this),\n                /*#__PURE__*/ (0,react_jsx_dev_runtime__WEBPACK_IMPORTED_MODULE_0__.jsxDEV)(\"label\", {\n                    htmlFor: \"email\",\n                    children: \"Email\"\n                }, void 0, false, {\n                    fileName: \"C:\\\\Users\\\\admin\\\\Documents\\\\VisualStudioCode\\\\Website\\\\pages\\\\index.tsx\",\n                    lineNumber: 29,\n                    columnNumber: 9\n                }, this),\n                /*#__PURE__*/ (0,react_jsx_dev_runtime__WEBPACK_IMPORTED_MODULE_0__.jsxDEV)(\"input\", {\n                    type: \"text\",\n                    id: \"email\",\n                    name: \"email\",\n                    required: true\n                }, void 0, false, {\n                    fileName: \"C:\\\\Users\\\\admin\\\\Documents\\\\VisualStudioCode\\\\Website\\\\pages\\\\index.tsx\",\n                    lineNumber: 30,\n                    columnNumber: 9\n                }, this),\n                /*#__PURE__*/ (0,react_jsx_dev_runtime__WEBPACK_IMPORTED_MODULE_0__.jsxDEV)(\"button\", {\n                    type: \"submit\",\n                    children: \"Subscribe\"\n                }, void 0, false, {\n                    fileName: \"C:\\\\Users\\\\admin\\\\Documents\\\\VisualStudioCode\\\\Website\\\\pages\\\\index.tsx\",\n                    lineNumber: 31,\n                    columnNumber: 9\n                }, this)\n            ]\n        }, void 0, true, {\n            fileName: \"C:\\\\Users\\\\admin\\\\Documents\\\\VisualStudioCode\\\\Website\\\\pages\\\\index.tsx\",\n            lineNumber: 26,\n            columnNumber: 7\n        }, this)\n    }, void 0, false, {\n        fileName: \"C:\\\\Users\\\\admin\\\\Documents\\\\VisualStudioCode\\\\Website\\\\pages\\\\index.tsx\",\n        lineNumber: 25,\n        columnNumber: 5\n    }, this);\n}\n//# sourceURL=[module]\n//# sourceMappingURL=data:application/json;charset=utf-8;base64,eyJ2ZXJzaW9uIjozLCJmaWxlIjoiLi9wYWdlcy9pbmRleC50c3guanMiLCJtYXBwaW5ncyI6Ijs7Ozs7Ozs7O0FBQXlCO0FBQ1YsU0FBU0MsWUFBWTtJQUNsQyxNQUFNQyxlQUFlLE9BQU9DLFFBQTRDO1FBQ3RFQSxNQUFNQyxjQUFjO1FBQ3BCLE1BQU1DLFNBQVNGLE1BQU1FLE1BQU07UUFLM0IsTUFBTUMsT0FBTztZQUNYQyxnQkFBZ0JGLE9BQU9HLElBQUk7WUFDM0JDLGlCQUFpQkosT0FBT0ssS0FBSztRQUMvQjtRQUNBLDBDQUEwQztRQUMxQ0MsTUFBTSw4QkFBOEI7WUFDbENDLFFBQVE7WUFDUkMsTUFBTUMsS0FBS0MsU0FBUyxDQUFDO2dCQUNuQlIsZ0JBQWdCRCxLQUFLQyxjQUFjO2dCQUNuQ0UsaUJBQWlCSCxLQUFLRyxlQUFlO2dCQUNyQ08sY0FBYztZQUNoQjtRQUNGO0lBQ0Y7SUFDQSxxQkFDRSw4REFBQ0M7UUFBSUMsV0FBVTtrQkFDYiw0RUFBQ0M7WUFBS0MsVUFBVWxCOzs4QkFDZCw4REFBQ21CO29CQUFNQyxTQUFROzhCQUFPOzs7Ozs7OEJBQ3RCLDhEQUFDQztvQkFBTUMsTUFBSztvQkFBT0MsSUFBRztvQkFBT2pCLE1BQUs7b0JBQU9rQixRQUFROzs7Ozs7OEJBQ2pELDhEQUFDTDtvQkFBTUMsU0FBUTs4QkFBUTs7Ozs7OzhCQUN2Qiw4REFBQ0M7b0JBQU1DLE1BQUs7b0JBQU9DLElBQUc7b0JBQVFqQixNQUFLO29CQUFRa0IsUUFBUTs7Ozs7OzhCQUNuRCw4REFBQ0M7b0JBQU9ILE1BQUs7OEJBQVM7Ozs7Ozs7Ozs7Ozs7Ozs7O0FBSTlCLENBQUMiLCJzb3VyY2VzIjpbIndlYnBhY2s6Ly8vLi9wYWdlcy9pbmRleC50c3g/MDdmZiJdLCJzb3VyY2VzQ29udGVudCI6WyJpbXBvcnQgUmVhY3QgZnJvbSAncmVhY3QnXHJcbmV4cG9ydCBkZWZhdWx0IGZ1bmN0aW9uIFN1YnNjcmliZSgpIHtcclxuICBjb25zdCBoYW5kbGVTdWJtaXQgPSBhc3luYyAoZXZlbnQ6IFJlYWN0LkZvcm1FdmVudDxIVE1MRm9ybUVsZW1lbnQ+KSA9PiB7XHJcbiAgICBldmVudC5wcmV2ZW50RGVmYXVsdCgpO1xyXG4gICAgY29uc3QgdGFyZ2V0ID0gZXZlbnQudGFyZ2V0IGFzIHR5cGVvZiBldmVudC50YXJnZXQgJiB7XHJcbiAgICAgIG5hbWU6IHsgdmFsdWU6IHN0cmluZyB9O1xyXG4gICAgICBlbWFpbDogeyB2YWx1ZTogc3RyaW5nIH07XHJcbiAgICB9O1xyXG5cclxuICAgIGNvbnN0IGRhdGEgPSB7XHJcbiAgICAgIHN1YnNjcmliZXJOYW1lOiB0YXJnZXQubmFtZSxcclxuICAgICAgc3Vic2NyaWJlckVtYWlsOiB0YXJnZXQuZW1haWwsXHJcbiAgICB9O1xyXG4gICAgLy9jYWxsIHRvIHRoZSBOZXRsaWZ5IEZ1bmN0aW9uIHlvdSBjcmVhdGVkXHJcbiAgICBmZXRjaChcIi4vLm5ldGxpZnkvZnVuY3Rpb25zL2VtYWlsXCIsIHtcclxuICAgICAgbWV0aG9kOiBcIlBPU1RcIixcclxuICAgICAgYm9keTogSlNPTi5zdHJpbmdpZnkoe1xyXG4gICAgICAgIHN1YnNjcmliZXJOYW1lOiBkYXRhLnN1YnNjcmliZXJOYW1lLFxyXG4gICAgICAgIHN1YnNjcmliZXJFbWFpbDogZGF0YS5zdWJzY3JpYmVyRW1haWwsXHJcbiAgICAgICAgaW52aXRlZUVtYWlsOiBcImFtaXI1bW9kYW5AZ21haWwuY29tXCIsXHJcbiAgICAgIH0pLFxyXG4gICAgfSk7XHJcbiAgfTtcclxuICByZXR1cm4gKFxyXG4gICAgPGRpdiBjbGFzc05hbWU9XCJzdWJzY3JpYmUtZm9ybS1jb250YWluZXJcIj5cclxuICAgICAgPGZvcm0gb25TdWJtaXQ9e2hhbmRsZVN1Ym1pdH0+XHJcbiAgICAgICAgPGxhYmVsIGh0bWxGb3I9XCJuYW1lXCI+TmFtZTwvbGFiZWw+XHJcbiAgICAgICAgPGlucHV0IHR5cGU9XCJ0ZXh0XCIgaWQ9XCJuYW1lXCIgbmFtZT1cIm5hbWVcIiByZXF1aXJlZCAvPlxyXG4gICAgICAgIDxsYWJlbCBodG1sRm9yPVwiZW1haWxcIj5FbWFpbDwvbGFiZWw+XHJcbiAgICAgICAgPGlucHV0IHR5cGU9XCJ0ZXh0XCIgaWQ9XCJlbWFpbFwiIG5hbWU9XCJlbWFpbFwiIHJlcXVpcmVkIC8+XHJcbiAgICAgICAgPGJ1dHRvbiB0eXBlPVwic3VibWl0XCI+U3Vic2NyaWJlPC9idXR0b24+XHJcbiAgICAgIDwvZm9ybT5cclxuICAgIDwvZGl2PlxyXG4gICk7XHJcbn1cclxuIl0sIm5hbWVzIjpbIlJlYWN0IiwiU3Vic2NyaWJlIiwiaGFuZGxlU3VibWl0IiwiZXZlbnQiLCJwcmV2ZW50RGVmYXVsdCIsInRhcmdldCIsImRhdGEiLCJzdWJzY3JpYmVyTmFtZSIsIm5hbWUiLCJzdWJzY3JpYmVyRW1haWwiLCJlbWFpbCIsImZldGNoIiwibWV0aG9kIiwiYm9keSIsIkpTT04iLCJzdHJpbmdpZnkiLCJpbnZpdGVlRW1haWwiLCJkaXYiLCJjbGFzc05hbWUiLCJmb3JtIiwib25TdWJtaXQiLCJsYWJlbCIsImh0bWxGb3IiLCJpbnB1dCIsInR5cGUiLCJpZCIsInJlcXVpcmVkIiwiYnV0dG9uIl0sInNvdXJjZVJvb3QiOiIifQ==\n//# sourceURL=webpack-internal:///./pages/index.tsx\n");

/***/ }),

/***/ "react":
/*!************************!*\
  !*** external "react" ***!
  \************************/
/***/ ((module) => {

module.exports = require("react");

/***/ }),

/***/ "react/jsx-dev-runtime":
/*!****************************************!*\
  !*** external "react/jsx-dev-runtime" ***!
  \****************************************/
/***/ ((module) => {

module.exports = require("react/jsx-dev-runtime");

/***/ })

};
;

// load runtime
var __webpack_require__ = require("../webpack-runtime.js");
__webpack_require__.C(exports);
var __webpack_exec__ = (moduleId) => (__webpack_require__(__webpack_require__.s = moduleId))
var __webpack_exports__ = (__webpack_exec__("./pages/index.tsx"));
module.exports = __webpack_exports__;

})();