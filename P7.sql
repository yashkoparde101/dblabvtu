-- p7.sql
-- MongoDB CRUD operations
-- Install MongoDB on Ubuntu (Open Source NoSQL Database)
-- Note: MongoDB is NOT related to MySQL and runs separately

-- Update package index
sudo apt update

-- Install MongoDB
sudo apt install -y mongodb

-- Start MongoDB service
sudo systemctl start mongodb

-- Enable MongoDB on boot
sudo systemctl enable mongodb

-- Check MongoDB status
sudo systemctl status mongodb

-- Open MongoDB shell
mongo


-- Create a collection named 'comments'
db.comments.insert({
    name: 'Harry',
    lang: 'JavaScript',
    member_since: 5
})


-- Insert multiple documents
db.comments.insertMany([
    {
        name: 'Harry',
        lang: 'JavaScript',
        member_since: 5
    },
    {
        name: 'Rohan',
        lang: 'Python',
        member_since: 3
    },
    {
        name: 'Lovish',
        lang: 'Java',
        member_since: 4
    }
])


-- Read / Find documents
db.comments.find({ lang: 'Python' })


-- Update a document (with upsert)
db.comments.updateOne(
    { name: 'Shubham' },
    {
        $set: {
            name: 'Harry',
            lang: 'JavaScript',
            member_since: 51
        }
    },
    { upsert: true }
)


-- Rename a field in a document
db.comments.update(
    { name: 'Rohan' },
    {
        $rename: {
            member_since: 'member'
        }
    }
)


-- Delete a document
db.comments.remove({ name: 'Harry' })
