function doGet(e){

 // Change Spread Sheet url
 var ss = SpreadsheetApp.openByUrl("https://docs.google.com/spreadsheets/d/1lN0slE4Lxwd8wALTy3eLXPlKL6RTwNNmr_HcBsgBqnQ/edit#gid=0");

// Sheet Name, Chnage Sheet1 to Users in Spread Sheet. Or any other name as you wish
 var sheet = ss.getSheetByName("Sheet1");

 return getUsers(sheet);

}


function getUsers(sheet){
  var jo = {};
  var dataArray = [];

// collecting data from 2nd Row , 1st column to last row and last column
  var rows = sheet.getRange(2,1,sheet.getLastRow(), sheet.getLastColumn()).getValues();
  // url	fid	name	nick	birth_date	height	weight	association	class	locality	country
  for(var i = 0, l = rows.length; i<l ; i++){
    var dataRow = rows[i];
    var record = {};
    record['name'] = dataRow[0];
    record['nickname'] = dataRow[1];
    record['height'] = dataRow[2];
    record['city'] = dataRow[3];
    record['country'] = dataRow[4];
    record['camp_id'] = dataRow[5];
    record['weight_class_id'] = dataRow[6];

    dataArray.push(record);

  }

  jo.user = dataArray;

  var result = JSON.stringify(jo);

  return ContentService.createTextOutput(result).setMimeType(ContentService.MimeType.JSON);

}  
