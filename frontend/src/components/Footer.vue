<template>
  <footer>
    <hr />
    <h3 id="faq">질문과 답변</h3>

    <p><b>Q. 꼬맨틀은 무엇인가요?</b></p>
    <p>A.</p>
    <ul>
      <li>
        꼬맨틀은 오늘의 단어를 맞추는 게임입니다. 정답 단어를 추측하면, 추측한
        단어가 정답 단어와 얼마나 유사한지 유사도 점수로 알려줍니다. 가장 유사한
        단어의 유사도와 가까운 단어를 추측하면서, 정답 단어를 맞춰보세요.
      </li>
    </ul>

    <p><b>Q. 정답 단어에는 어떤 단어가 포함되어 있나요?</b></p>
    <p>A.</p>
    <ul>
      <li>
        정답 단어는 명사 뿐만 아니라 동사, 형용사 등 모든 품사를 포함하며,
        품사의 기본형만 해당합니다.<br />
        <span class="subtext"
          >예시) 행복, 기쁘다, 사랑하다, 야옹, 그래도, 갑자기</span
        >
      </li>
      <li>
        정답 단어는 Wiktionary에서 자주 쓰이는 한국어 낱말을 가져와 두 글자
        이상의 단어만을 추출, 임의 선택합니다. 정답 단어는 모두 두 글자
        이상이지만, 전략적인 이유로 한 글자 단어를 추측해볼 수 있습니다.
      </li>
    </ul>

    <p><b>Q. 유사도는 무엇인가요?</b></p>
    <p>A.</p>
    <ul>
      <li>
        꼬맨틀에서 추측한 단어와 정답 단어가 의미맥락적으로 얼마나 비슷한지에
        대한 정도를 -100에서 +100까지의 숫자로 계산한 점수입니다. +이면서,
        숫자가 클수록 유사한 정도가 크다고 이해할 수 있습니다.
      </li>
      <li>
        유사도 추정을 위해 꼬맨틀에서는
        <a href="https://commoncrawl.org/">Common Crawl</a> 및
        <a href="https://www.wikipedia.org/">Wikipedia</a> 데이터로 사전 훈련된
        <a href="https://fasttext.cc/docs/en/crawl-vectors.html">FastText</a>를
        사용하였습니다. 훈련된 데이터에 따라 편향이 있을 수 있습니다.
      </li>
      <li>
        꼬맨틀에서는 정답 단어와 가장 비슷한 1000개의 단어 안에 추측한 단어가
        있을 경우, 단어의 유사도 순위를 함께 제공합니다.
      </li>
    </ul>

    <p><b>Q. 정답 단어와 유사도가 높은 단어, 왜 일까요?</b></p>
    <p>A.</p>
    <ul>
      <li>
        꼬맨틀의 유사도는 단어의 철자의 유사도가 아닌, 의미에 대한 유사도라는
        점을 기억해주세요. 의미적 맥락을 고려해볼 때 정답 단어와 같은 문단 혹은
        문장에 언급될 법한 단어로 추측해보세요.
      </li>
      <li>
        의미적으로는 반대의 의미를 갖더라도, 유사한 맥락에 사용된다면 유사도가
        비슷하답니다. ‘사랑'과 ‘증오'은 의미적으로 반대되는 것처럼 보일 수
        있지만, 같은 맥락에서 자주 사용되기 때문에 종종 비슷한 유사도를
        갖습니다.
      </li>
      <li>
        동음이의어를 고려해주세요. 예를 들어 ‘밤’하면 쉽게 떠오르는 2가지 의미 -
        어두운 ‘밤', 가을에 따먹는 ‘밤'- 중 정답 단어와 의미맥락적으로 비슷한
        밤은 어떤 의미일지 추측해보세요.
      </li>
    </ul>

    <p><b>Q. 그래도 유사도가 이해되지 않을때에는 어떻게 하죠?</b></p>
    <p>A.</p>
    <ul>
      <li>
        정답 단어를 맞춘 뒤에도 추측 단어는 계속 입력할 수 있습니다. 정답 단어와
        유사하다고 생각되는 다른 추측 단어를 입력해보면서, 유사도를
        확인해보세요.
      </li>
      <li>
        정답 단어를 맞추었을 때 함께 제공되는 유사도 기준 상위 1000개의 단어를
        살펴보세요. 정답 단어와 유사한 정도가 큰 단어들을 살펴보다보면, 유사도에
        대한 이해도 높이고 정답 단어에 도달하기까지 추측 횟수도 줄일 수 있을
        거예요.
      </li>
    </ul>

    <p><b>Q. 하루에 한 번 이상 플레이할 수는 없나요?</b></p>
    <p>A.</p>
    <ul>
      <li>
        꼬맨틀은 하루에 한 번만 플레이 할 수 있습니다. 저희는
        <a href="https://www.nytimes.com/games/wordle/index.html">Wordle</a>과
        같은 게임의 핵심 요소는 "하루에 한 번만, 모두가 동일한 정답"이라고
        생각합니다.
      </li>
      <li>
        정답 단어는 국제표준시(UTC) 기준 매일 오전 9시 또는 한국 시간 기준
        자정에 바뀝니다.
      </li>
    </ul>

    <p><b>Q. 어제의 정답은 무엇인가요?</b></p>
    <p>A.</p>
    <ul>
      <li>
        <span id="yesterday2"
          >어제의 정답 단어는 <b>"{{ yesterday_keyword }}"</b>입니다.</span
        >
      </li>
      <!-- link 부분 -->
      <span id="yesterday-nearest1k"
        ><router-link :to="'/nearest1k/' + (puzzle_number - 1)"
          >유사도 기준 상위 1000개의 단어</router-link
        >를 확인할 수 있습니다.</span
      >
    </ul>

    <p><b>Q. 플레이 기록을 볼 수 있나요?</b></p>
    <p>A.</p>
    <ul>
      <li>
        꼬맨틀 페이지는 쿠키를 사용하여 설정 및 개인 게임 통계를 저장하며, 통계
        수집을 위해 쿠키 정보를 수집합니다.
      </li>
      <li>
        동일 브라우저에서 플레이했다면, 꼬맨틀의 정답 단어를 맞추었을 때
        노출되는 영역에서 가장 처음 풀었던 꼬맨틀의 번호, 플레이한 게임 수와 그
        결과(정답, 연속 정답, 포기), 지금까지 추측했던 단어의 총 갯수를 알 수
        있습니다.
      </li>
    </ul>

    <p>
      <b>Q. 데이터 시각화 전문기업 뉴스젤리는 왜 꼬맨틀을 만들었나요?</b>
    </p>
    <p>A.</p>
    <ul>
      <li>
        뉴스젤리는 데이터 시각화 전문 기업으로서, 데이터 활용을 위한 시각화
        가치를 널리 알리는 일을 하고 있습니다. 따라서 저희에게 데이터와 시각화는
        일상과도 같은데요. 사람들의 쉽게 데이터와 시각화를 경험할 수 있는 ‘재미
        있는 무언가'를 만들고 싶었습니다.
      </li>
      <li>
        단어 맞추기 게임인 꼬맨틀의 핵심은 ‘단어' 데이터인데요. 단어를 단순히
        자음과 모음의 구성으로 보는 기본적인 관점에서 나아가, 여러 단어 간
        관계를 컴퓨터가 이해할 수 있도록 변환(워드 임베딩)을 하고, 의미 맥락적
        유사도를 찾는 심도 깊은 데이터 활용 사례를 공유하고자 하였습니다.
      </li>
      <li>
        꼬맨틀을 플레이하는 가운데 사용자는 내가 추측한 단어 기록을 데이터와
        직관적인 시각화로 확인 할 수 있는데요! 꼬맨틀 플레이 경험을 통해 데이터
        시각화의 가치를 경험할 수 있기를 기대합니다. (데이터 시각화는 앞으로 더
        추가될 예정입니다.)
      </li>
    </ul>

    <p><b>Q. 소스코드를 볼 수 있나요?</b></p>
    <p>A.</p>
    <ul>
      <li><a href="https://github.com/NewsJelly/semantle-ko">짜잔</a>.</li>
    </ul>

    <p><b>Q. 다른 질문이나 피드백은 어떻게 보내나요?</b></p>
    <p>A.</p>
    <ul>
      <li>
        <a href="https://github.com/NewsJelly/semantle-ko/issues"
          >꼬맨틀 깃헙 이슈</a
        >, <a href="mailto:help@newsjel.ly">메일</a>로 문의해주세요.
      </li>
    </ul>

    <hr />

    <p>
      꼬맨틀은 David Turner의
      <a href="https://semantle.novalis.org">Semantle</a>과 Johannes Gätjen의
      <a href="http://semantlich.johannesgaetjen.de">Semantlich</a>를 바탕으로
      데이터 시각화 전문기업
      <a href="https://newsjel.ly/" target="_blank">뉴스젤리</a>가 만들었습니다.
    </p>
  </footer>
</template>

<script setup lang="ts">
const props = defineProps<{
  puzzle_number: number;
  yesterday_keyword: string;
}>();
</script>

