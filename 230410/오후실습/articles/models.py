from django.db import models
from django.conf import settings

# Create your models here.
# (1) User 모델을 참조하는 외래키 작성
class Article(models.Model):
    user = models.ForeignKey(settings.AUTH_USER_MODEL, on_delete=models.CASCADE)
    title = models.CharField(max_length=30)
    content = models.TextField()
    image = models.ImageField(blank=True, null=True)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    def __str__(self):
        return f'{self.id}번째글 - {self.title}'
    
# [1] Comment 모델 설정
class Comment(models.Model):
    # CASCADE -> article이 삭제되면 같이 삭제하는 옵션 (데이터 무결성)
    article = models.ForeignKey(Article, on_delete=models.CASCADE)
    content = models.CharField(max_length=200)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    def __str__(self):
        return self.content
    
# [2] 모델 수정사항 발생했으므로 migration 과정 진행