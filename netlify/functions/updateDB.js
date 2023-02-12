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

  // Get most recent ID
  const { data: recent_id, error: read } = await supabase
    .from('analytics')
    .select('id')
    .order('id', { ascending: false })
    .limit(1);

  // Insert a row
  const { data, error: write } = await supabase
    .from('analytics')
    .insert([
      {
        id: recent_id[0]['id'] + 1,
        page: requestBody.page,
        author: requestBody.author,
        comment: requestBody.comment,
      },
    ]);

  // Did it work?
  console.log(recent_id[0]['id'], write);

  if (write !== null) {
    return {
      statusCode: 500,
      body: JSON.stringify("Database not accessible!"),
    };
  }

  return {
    statusCode: 200,
    body: JSON.stringify("Database updated successfully!"),
  };

}