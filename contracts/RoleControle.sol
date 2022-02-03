// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/Strings.sol";

contract RoleControle is Ownable {

    enum ROLE {
        ADMIN,
        CEO_Role,
        CTO_Role,
        CFO_Role,
        CMO_Role,
        COO_Role,
        CLevel_Role
    }

    mapping(address => ROLE[]) roles; 

    constructor (   
                address _ceoaddr
                    ) 
        {
        roles[owner()].push(ROLE.ADMIN);

        roles[_ceoaddr].push(ROLE.CEO_Role);
        roles[_ceoaddr].push(ROLE.CLevel_Role);

        }



    modifier onlyAdmin () {
        uint i = 0;
        while   ( (roles[msg.sender])[i] != ROLE.ADMIN) {
            i++;
        }
        require((roles[msg.sender])[i] == ROLE.ADMIN,"You are not Admin");
        _;
    }
    modifier onlyCEO () {
        uint i = 0;
        while   ((roles[msg.sender])[i] != ROLE.CEO_Role) {
            i++;
        }
        require((roles[msg.sender])[i] == ROLE.CEO_Role, "You are not chief executive officer");
        _;
    }

    modifier onlyCTO () {
        uint i = 0;
        while   ((roles[msg.sender])[i] != ROLE.CTO_Role) {
            i++;
        }
        require((roles[msg.sender])[i] == ROLE.CTO_Role, "You are not chief technology officer ");
        _;
    }

    modifier onlyCFO () {
        uint i = 0;
        while   ((roles[msg.sender])[i] != ROLE.CFO_Role) {
            i++;
        }
        require((roles[msg.sender])[i] == ROLE.CFO_Role, "You are not chief financial officer ");
        _;
    }

    modifier onlyCMO () {
        uint i = 0;
        while   ((roles[msg.sender])[i] != ROLE.CMO_Role) {
            i++;
        }
        require((roles[msg.sender])[i] == ROLE.CMO_Role, "You are not chief marketing officer");
        _;
    }

    modifier onlyCOO () {
        uint i = 0;
        while   ((roles[msg.sender])[i] != ROLE.COO_Role) {
            i++;
        }
        require((roles[msg.sender])[i] == ROLE.COO_Role, "You are not chief operating officer");
        _;
    }

    modifier only_CLevel () {
        uint i = 0;
        while   ((roles[msg.sender])[i] != ROLE.CLevel_Role) {
            i++;
        }
        require((roles[msg.sender])[i] == ROLE.CLevel_Role, "This address is not Permit to Execute function !");
        _;
    }

    //set Role form admin
    //  Role    :  Number
    //  admin   :   0
    //  CEO     :   1
    //  CTO     :   2
    //  CFO     :   3
    //  CFO     :   4
    //  CFO     :   5
    function setRoles (address _accAddress, ROLE _role) external onlyAdmin {
        require( _accAddress != address(0), "Invalid Address" );
        require(uint(_role) >= 0, "Invalid Role");
        require(uint(_role) <= 5,"Invalid Role" );

        for (uint256 i = 0; i < roles[_accAddress].length;) {                   //Loop check repeat Role in Array[] from Address
            require((roles[_accAddress])[i] != _role,"Invalid Role");
          i++ ;  
        }
        roles[_accAddress].push(_role);                                         //Add Role in Array[] from Address

        if(_role != ROLE.ADMIN){                                                //check Role in Array[] from Address is Admin?
            roles[_accAddress].push(ROLE.CLevel_Role);                          //Add Role C level in Arrey[] from Address
        }
    }

    function removeRoles (address _accAddress, ROLE _role) external onlyAdmin {
        require( _accAddress != address(0), "Invalid Address" );
        require(uint(_role) >= 0, "Invalid Role");
        require(uint(_role) <= 5,"Invalid Role" );

        uint i = 0;
        while ((roles[_accAddress])[i] != _role )   {                           //Loop find Role in Array[] from Address    Exp. Address[Role(0), Role(i), Role(i+1), ...]
            i++;
        }
        require((roles[_accAddress])[i] == _role,"Invalid Role" );              //check Role in Array[] from Address        Exp. Role == Address[Role(i)]
        delete (roles[_accAddress])[i];                                         //Remove Role == Address[Role(i)]

        if (_role != ROLE.ADMIN)                                                //check Role Admin in Array[] form Address
        {
            uint j = 0;
            while ((roles[_accAddress])[j] != ROLE.CLevel_Role )   {            //Loop find Role C Level in Array[] from Address
            j++;
            }
            require((roles[_accAddress])[j] == ROLE.CLevel_Role,"Invalid Role" );   //check Role C Level in Array[] from Address
            delete (roles[_accAddress])[j];                                      //Remove Role == C Level]
        }
    }

        function Num_of_Role() public pure virtual returns (string memory) {
        return "CEO[1] : CTO[2] : CFO[3] : CMO[4] : COO[5]";
    }
}

