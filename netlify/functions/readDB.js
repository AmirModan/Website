// Grab our credentials from a .env file or environment variables
const {
  DATABASE_URL,
  SUPABASE_SERVICE_API_KEY,
} = process.env;

// Connect to our database 
const { createClient } = require('@supabase/supabase-js');
const supabase = createClient(DATABASE_URL, SUPABASE_SERVICE_API_KEY);

// Our standard serverless handler function
exports.handler = async event => {

  const requestBody = JSON.parse(event.body);

  // Insert a row
  const { data, error } = await supabase
    .from('analytics')
    .select('*')
    .eq('page', requestBody.page)
    .order('id', { ascending: false });

  let author_array = [];
  let comment_array = [];

  for (let commentNumber = 0; commentNumber < data.length; commentNumber++) {
    // Did it work?
    console.log(data[commentNumber], error);
    author_array[commentNumber] = data[commentNumber]['author'];
    comment_array[commentNumber] = data[commentNumber]['comment'];
  }
  console.log(comment_array.length, error);

  if (error !== null) {
    return {
      statusCode: 500,
      body: JSON.stringify("Database not accessible!"),
    };
  }

  return {
    statusCode: 200,
    body: JSON.stringify({
      author: author_array,
      comment: comment_array,
    }),
  };

}