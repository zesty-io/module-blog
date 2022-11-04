<style>
    .container {
        width : 80%;
        margin : auto;
        font-family: Arial, Helvetica, sans-serif;
    }
    .article {
        display : flex;
        flex-direction : row;
        padding : 30px;
    }
    .feature-image {
        padding-right : 30px;
    }
    .article-header{
        line-height : 0;
    }
    .category {
        list-style: none;
        padding : 0;
        margin : 0;
    }
    .category > li {
        display : inline;
        margin-left : 20px;
    }
    .header {
        text-align : center;
        padding : 20px;
    }
</style>
<div class="container">
    <div class="header">
        <h1>Articles Written by {{this.authors_name}}</h1>
    </div>
    <hr />
    <div class="articles">
        {{each articles as article where author = '{this.zuid}' sort by date DESC limit 20}}
            <div class="article">
                <div class="feature-image">
                    <img src="{{article.article_feature_image.getImage(240,160,crop) }}"" />
                </div>
                <div>
                    <h1 class="article-header">{{ article.article_title }}</h1>
                    <h4>{{article.article_sub_title}}</h6>	
                    <p>{{article.article_content.striptags(0,220)}}... <a href="{{article.getUrl()}}">read more</a></p>
                  
                   
                </div>
                
            </div>
        {{end-each}}
    </div>
</div>