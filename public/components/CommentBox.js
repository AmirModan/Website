import React from 'react'

export default class CommentBox extends React.Component {

    maxNumComments = 5;

    constructor(props) {
        super();

        this.state = {
            pageName: props.pageName,
            showComments: false,
        }
    }

    render() {

        async function handleSubmit(event) {
            event.preventDefault();
            //call to the Netlify Function you created
            const response = await fetch("../.netlify/functions/updateDB", {
                method: "POST",
                body: JSON.stringify({
                    page: this.state.pageName,
                    author: document.getElementById("name").value,
                    comment: document.getElementById("comment").value,
                }),
            });
            if (!response.ok) {
                const commentStatus = document.getElementById("comment-status");
                commentStatus.innerText = "Comment could not be posted. Please try again later";
                commentStatus.style.color = "red"
            } else {
                const form = document.getElementById("contact-form");
                form.reset();
                const commentStatus = document.getElementById("comment-status");
                commentStatus.innerText = "Comment Posted!";
                commentStatus.style.color = "green"
            }
        }

        async function fetchComments(event) {
            event.preventDefault();
            if (!this.state.showComments) {
                //call to the Netlify Function you created
                const response = await fetch("../.netlify/functions/readDB", {
                    method: "POST",
                    body: JSON.stringify({
                        page: this.state.pageName,
                        author: document.getElementById("name").value,
                        comment: document.getElementById("comment").value,
                    }),
                });
                if (!response.ok) {
                    const commentStatus = document.getElementById("comment-status");
                    commentStatus.innerText = "Comment could not be fetched. Please try again later";
                    commentStatus.style.color = "red"
                } else {
                    const responseBody = await response.json();
                    for (let commentNumber = 0; commentNumber < this.maxNumComments; commentNumber++) {
                        if (commentNumber < responseBody.comment.length) {
                            const author = document.getElementById("author" + commentNumber);
                            const comment = document.getElementById("comment" + commentNumber);
                            author.innerText = responseBody.author[commentNumber];
                            comment.innerText = responseBody.comment[commentNumber];
                        } else {
                            const commentCont = document.getElementById("comment-cont" + commentNumber);
                            commentCont.style.display = "none";
                        }

                    }
                    this.setState({ showComments: true });
                    const commentsBtn = document.getElementById("commentsBtn");
                    commentsBtn.innerText = "Hide Comments";
                }
            } else {
                this.setState({ showComments: false });
                const commentsBtn = document.getElementById("commentsBtn");
                commentsBtn.innerText = "Show Comments";
            }
        }

        return (
            <>
                <h2>Comments</h2>
                <div className="image-container">
                    <button id="commentsBtn" onClick={fetchComments.bind(this)}>Show Comments</button>
                </div>
                <div style={{ display: this.state.showComments ? "block" : "none" }} id="comments-div">
                    <div id="comment-cont0" className="comment-container">
                        <div className="image-container">
                            <h3 id="author0"></h3>
                        </div>
                        <div className="text-container">
                            <p id="comment0"></p>
                        </div>
                    </div>
                    <div id="comment-cont1" className="comment-container">
                        <div className="image-container">
                            <h3 id="author1"></h3>
                        </div>
                        <div className="text-container">
                            <p id="comment1"></p>
                        </div>
                    </div>
                    <div id="comment-cont2" className="comment-container">
                        <div className="image-container">
                            <h3 id="author2"></h3>
                        </div>
                        <div className="text-container">
                            <p id="comment2"></p>
                        </div>
                    </div>
                    <div id="comment-cont3" className="comment-container">
                        <div className="image-container">
                            <h3 id="author3"></h3>
                        </div>
                        <div className="text-container">
                            <p id="comment3"></p>
                        </div>
                    </div>
                    <div id="comment-cont4" className="comment-container">
                        <div className="image-container">
                            <h3 id="author4"></h3>
                        </div>
                        <div className="text-container">
                            <p id="comment4"></p>
                        </div>
                    </div>
                </div>

                <form className='image-container' id="contact-form" name="contact-form">
                    <label htmlFor="name">Name</label>
                    <br></br>
                    <textarea id="name" name="name" rows="1" cols="50" />
                    <br></br><br></br><br></br>
                    <label htmlFor="comment">Comment *</label>
                    <br></br>
                    <textarea id="comment" name="comment" rows="4" cols="50" required></textarea>
                    <br></br>
                    <p id="comment-status" name="comment-status">&nbsp;</p>
                    <br></br>
                    <button type="submit" onClick={handleSubmit.bind(this)}>Post Comment</button>
                </form>
            </>
        )

    }
}