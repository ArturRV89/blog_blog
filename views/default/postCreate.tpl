<body>
{include file='../total/header.tpl'}
<div class="container">
    {include file='../total/navigate.tpl'}

    <form action="/index.php?controller=post&action=addpost" method="post">
        <div class="mb-3">
            <label for="exampleInputEmail1" class="form-label">Title</label>
            <input name="title" type="text" class="form-control" id="title" aria-describedby="emailHelp">
        </div>
        <div class="mb-3">
            <label for="exampleInputEmail1" class="form-label">Subtitle</label>
            <input name="subtitle" type="text" class="form-control" id="subtitle" aria-describedby="emailHelp">
        </div>
        <div class="mb-3">
            <label for="exampleInputEmail1" class="form-label">Content</label>
            <textarea name="content" id="content" cols="77" rows="5"></textarea>
        </div>

        <button type="submit" class="btn btn-primary">Create post</button>
    </form>

    {include file='../total/footer.tpl'}
</div>
</body>
</html>