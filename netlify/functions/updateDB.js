// Grab our credentials from a .env file or environment variables
import createClient from '@supabase/supabase-js'
const {
    DATABASE_URL,
    SUPABASE_SERVICE_API_KEY
} = process.env;

// Connect to our database 
const supabase = createClient(DATABASE_URL, SUPABASE_SERVICE_API_KEY);

// Our standard serverless handler function
exports.handler = async event => {

  // Insert a row
    const { data, error } = await supabase
        .from('analytics')
        .insert([
            { id: 1 },
        ]);

  // Did it work?
  console.log(data, error);
  
}