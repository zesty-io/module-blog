(** default code https://zesty.org/services/web-engine/introduction-to-parsley/parsley-autolayout **)
<style>
    .container {
        width : 80%;
        margin : auto;
        font-family: Arial, Helvetica, sans-serif;
    }
    .body-container {
        display : flex;
        justify-content : space-around;
    }
    .content-container {
        width : 60%
    }
    .side-container {
        width : 20%;
    }
    .major {
        text-align : center;
        padding : 50px;
    }
    .image-fit{
        display : block;
        width : 100%;
    }
    .recent-article{
        margin-bottom : 50px;
    }
    .categories-section{
        list-style : none;
        padding : 0;
        margin : 0;
    }
</style>
<div class="container">
    <header class="major">
        <h2>{{this.article_title}}</h2>
        <p>Written By: <a href="{{authors.filter(z.zuid = '{this.author}').getUrl()}}">{{authors.filter(z.zuid = '{this.author}').authors_name}}</a></p>              
    </header>
    <div class="body-container">
        <div class="content-container">
            <section>
                <img src="{{this.article_feature_image.getImage(600)}}" />
                {{ this.article_content }}
            <section>
        </div>
        <div class="side-container">
            <section>
                <h3>Category</h3>
                <ul class="categories-section">
                    {{each categories as category where find_in_set(z.zuid,'{this.article_category}')}}
                        <li><a href="{{category.getUrl()}}" class="icon fa-tag" title="">{{category.category_name}}</a></li>
                    {{end-each}}
                </ul>
            </section>
            <hr />
             <section>
                <h3>Recent Article</h3>
                {{each articles as latest where z.zuid != '{this.zuid}' limit 3 }}
                    <div class="recent-article">
                        <a href="#"><img class="image-fit" src="{{latest.article_feature_image.getImage(240,160,crop) }}" alt="" /></a>
                            <h3>{{latest.article_title}}</h3>
                            {{latest.article_content.subwords(20)}}...<a href="{{latest.getUrl()}}">Read More</a>
                        </a>
                    </div>
                {{end-each}}
            </section>
        </div>
    </div>
</div>