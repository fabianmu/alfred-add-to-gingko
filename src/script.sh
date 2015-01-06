# Add to Gingko for Alfred
# doc: https://github.com/chadhs/idonethis-for-alfred
# hello@fabian.mu / @fabianmu

# Your Gingko credentials

username="your-gingko-email"
password="your-gingko-password"


# Tree and ParentCard-ID

treeId="id of the tree"
parentCard="id of the parent card"


########### MAGIC ###########
### DO NOT EDIT BLOW HERE ###

tmp_file="/tmp/body.json"
body="{query}"

# let's replace single and double quotes with unicode values so we can include them easily in the body
body="${body//\'/\\u0027}"
body="${body//\"/\\u0022}"

# tmp file
cat > $tmp_file << DONE
{"parentId":"${parentCard}","treeId":"${treeId}","content":"${body}","position":1}
DONE

# send POST
curl -u $username:$password "https://gingkoapp.com/api/trees/${treeId}/cards" -H 'content-type: application/json' --data @${tmp_file}

rm $tmp_file
