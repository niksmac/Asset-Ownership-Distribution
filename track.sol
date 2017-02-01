pragma solidity ^0.4.0;
contract Tracks {
    
    address public STracksOwner;
    
    // Single Track details
    struct STrack{
        uint trackId; // unique Identifier number
        bytes32 trackName; 
        mapping (uint => Author) Authors; 
    }
    
    // Single Author details 
    struct Author {
        bytes32[] authorDetails;
    }
    
    Author thisAuthor;
    mapping (uint => STrack) public STracks;
    
    function Tracks(){
        STracksOwner = msg.sender;
    }
    
    function saveOwnership(uint trackId, bytes32 trackName) returns (uint identifier){
        STracks[trackId] = STrack(trackId, trackName);
    }
    
    function saveAuthorToTrack(bytes32[] AuthorsDetails, uint trackId){
        STrack includeAuthor = STracks[trackId];
        
        for (uint i = 0; i < AuthorsDetails.length; i++){
            Author details = thisAuthor;
            details.authorDetails.push(AuthorsDetails[i]);
            includeAuthor.Authors[i] = details;
        }
    }
}