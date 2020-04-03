import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: 'Returning Data',
    home: HomeScreen(),

   ));
}

//앱 실행이 처음 출력되는 스크리
class HomeScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text('Returning Data Demo')),
      body: Center(child: SelectionButton()), //SelectionButton을 body로 등록
    );
  }
}

//앱 초기 스크린의 body를 구성하는 위젯 클래스
class SelectionButton extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return RaisedButton( //버튼을 하나 추가
      onPressed: (){ //버튼을 누르면
        _navigateAndDisplaySeclection(context); //메소드 호충
      },
      child: Text('Pick an option, any option!'), //버튼에 텍스트 추가
    );
  }
  void _navigateAndDisplaySeclection(BuildContext context) async {
    /**
     * 새로운 스크린은 push하고 그 스크린으로부터 결과값을 받아 result로 저장
     * await 설정하면 result값을 수신할 때까지 대기함
     */
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context)=>SelectionScreen()) //새로운 스크린(라우터)를 적재함
    );
    // 현재 Scaffold 스크린의 컨텍스트를 추출해서
    Scaffold.of(context)
    ..removeCurrentSnackBar() //현재스낵바 제거
    ..showSnackBar((SnackBar(content: Text("$result"))));//새로운 스낵바를 생성해서 $result 값 출력
  }
}
// 초기 스크린에서 RaisedButton을 누를때 생성되는 두번째 스크린
class SelectionScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text('Pick an option')),
      body: Center( // 가운데 정렬로 컬럼을 추가
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(// 첫번째 자식
              padding: const EdgeInsets.all(8.0),
              child: RaisedButton( //버튼 추가
                onPressed: (){ //  버튼을 누르면
                  Navigator.pop(context,'Yep!'); // 현재 스크린을 제거하고, 결과값 Yep!를 반환
                },
                child: Text('Yep!'),
              ),
            ),
            Padding( // 두번쨰 자식
              padding: const EdgeInsets.all(8.0),
              child: RaisedButton(
                onPressed: (){
                  Navigator.pop(context, 'Nope!'); // 현재 스크린을 제거하고 결과값 Nope!을 반환홤
                },
                child: Text('Nope!'),
              ),

            )
          ],
        ),
      ),
    );
  }

}