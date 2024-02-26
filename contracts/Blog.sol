// SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;
import "./IBlog.sol";

contract Blog is IBlog {
    Post[] public posts;

    string public title;
    string public description;

    constructor(string memory _title, string memory _description) {
        title = _title;
        description = _description;
    }

    function createPost(string memory _title, string memory _content) public {
        Post memory _post = Post({
            id: posts.length,
            title: _title,
            content: _content,
            timestamp: block.timestamp
        });
        posts.push(_post);
    }

    function updatePost(
        uint256 _id,
        string memory _title,
        string memory _content
    ) public {
        Post memory _post = posts[_id];
        posts[_id] = Post({
            title: _title,
            content: _content,
            id: _post.id,
            timestamp: _post.timestamp
        });
    }

    function deletePost(uint256 _id) public {
        delete posts[_id];
    }

    function getPosts() public view returns (Post[] memory) {
        return posts;
    }
}
