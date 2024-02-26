// SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;

import "./Blog.sol";
import "./IBlog.sol";

contract BlogFactory is IBlog {
    mapping(address => Blog) spaces;

    function createNewBlogSpace(
        string calldata _title,
        string calldata _description
    ) external returns (address) {
        Blog newSpace = new Blog(_title, _description);

        spaces[address(newSpace)] = newSpace;
        return address(newSpace);
    }

    /// CMS FUNCTIONALITIES
    function createPost(
        address _spaceAddress,
        string calldata _title,
        string calldata _content
    ) public {
        spaces[_spaceAddress].createPost(_title, _content);
    }

    function updatePost(
        address _spaceAddress,
        uint256 _id,
        string calldata _title,
        string calldata _content
    ) public {
        spaces[_spaceAddress].updatePost(_id, _title, _content);
    }

    function deletePost(address _spaceAddress, uint256 _id) public {
        spaces[_spaceAddress].deletePost(_id);
    }

    function getPosts(
        address _spaceAddress
    ) public view returns (Post[] memory) {
        return spaces[_spaceAddress].getPosts();
    }
}
