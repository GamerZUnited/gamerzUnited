#Main Backend app URL:

`https://glacial-bayou-9575.herokuapp.com`

#ADMIN
##To Signup a user

###Send `post` request to `/signup`

Must provide these parameters:

```
first_name
last_name
email
username
password
age
sex
```

##To Login

###Send `post` request to `/login`

Must provide these parameters:

```
username
password
```

You will receive the following JSON:

```javascript
{ 
	access_token: "580dc0baa883a73a276c6558e21ec01e",
	first_name: "Bob",
	last_name: "Johnson",
	email: "bob@email.com",
	username: "johnson"
	sex: "male"
	age: 34
}
```

##To Add a Post

###Send `post` request to `/posts`

Must provide these parameters:

```
title
content
```

Headers:

```
Auth-Token
```

You will receive a JSON like:

```javascript
{ 
	id: 1
	title: “2k16.”, 
	content: "I win all the time"
}
```

...

#POSTS

##To Show All Posts 

###Send `get` request to `/posts`

Required parameters that you should provide:

Headers:

```
Auth-Token
```

You will receive an array of key value pairs of each post title, post content, and post id:

```javascript
[
	{ 
		id: 1
		title: “2k16.”, 
		content: "I win all the time"
	},
	{
		id: 2
		title: "Madden 100."
		content: "I win again"
	}
]
```