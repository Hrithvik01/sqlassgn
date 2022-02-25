db.Edutech.insertMany([{ 
        student:'sachin',
        current_session:'javaSceipt',
        assignments:['1','2','3']
       }, 
        {
            student:'prakhar', 
            current_session:'',
            assignments:1
        },   
     { 
        student:'Steve', 
        current_session:'Portals', 
        assignments:3 }])

/*
db.(collectionName).updateMany({#uniqueIdentifier},{#dataChange})
*/
db.Edutech.updateMany({assignments:'1'},{$set:{assignment:'2'}})
db.Edutech.deleteMany({})


