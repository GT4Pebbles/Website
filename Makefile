all:
	make index.html blog.html team.html

# snakemake --cores 1

clean:
	rm blog.html index.html team.html

index.html: templates/index_template.html scripts/parse_index.py css/style.css team/*.yaml posts/*.yaml
	python3 scripts/parse_index.py -t templates/index_template.html -o index.html

blog.html: templates/blog_template.html templates/blog-item-template.html scripts/parse_article.py posts/*.yaml
	python3 scripts/parse_article.py -t templates/blog_template.html -o blog.html -i templates/blog-item-template.html -d blog/ -p posts/ -v  

team.html: templates/team_template.html scripts/parse_teams.py team/*.yaml
	python3 scripts/parse_teams.py -t templates/team_template.html -o team.html -d team/ -v 

