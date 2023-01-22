pragma solidity <=0.7.0;

 
contract Citizen {
   
     
      mapping(uint256 => citizen) citizenlist;
    
     struct citizen{
         string citizen_name;
         string citizen_gender;
         string citizen_dob;
         uint256 citizen_ph_no;
         string citizen_address;
         uint256 citizen_annual_income;
     }
     citizen c;
     
     address owner;
     
   
      constructor()  public {
          owner = 0x564B5E9C81121a4A41288fFe934853041e3F9D03; //Address of Hospital
      }
      
     // modifier to give access only to hospital
       modifier isOwner() {

         require(msg.sender == owner, "Access is not allowed");

         _;

     }
     
     
     
     
     
     
     
   function store_citizen_details(uint16 citizen_id,string memory _citizen_name,string memory _citizen_gender,string memory _citizen_dob,uint256 _citizen_ph_no,string memory _citizen_address,uint256 _citizen_annual_income)public isOwner {
    
         c.citizen_name = _citizen_name;
         c.citizen_gender = _citizen_gender;
         c.citizen_dob = _citizen_dob;
         c.citizen_ph_no = _citizen_ph_no;
         c.citizen_address = _citizen_address;
         c.citizen_annual_income = _citizen_annual_income;
         
        citizenlist[citizen_id] = c;
          
   }
         
   
         function retreive_citizen_details(uint16 citizen_id) public view returns (string memory,string memory,string memory,uint256,string memory ,uint256){
             
     citizen memory c = citizenlist[citizen_id];
     
     return (c.citizen_name,c.citizen_gender,c.citizen_dob,c.citizen_ph_no,c.citizen_address,c.citizen_annual_income);
     
          }
           
              
}