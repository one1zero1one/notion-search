# Notion cli search

Using a token and workspace name, indexes all the titles 

## Install

Pick up `token_v2` cookie from browser and space name from `https://www.notion.so/<yourspacename>`

```bash
# set token
echo <token_v2> > $HOME/.notion_token
# get set space id
./notion-get-space-id <yourspacename> >  $HOME/.notion_space_id
# symlink
./install
```

## Run

```bash
# every so often
notion-search --build-index

# when need to quickly open a page
notion-search blabla
```