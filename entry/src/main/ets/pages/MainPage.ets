import CommonConstants from '../common/constants/CommonConstants';

@Entry
@Component
@Preview
struct Index {
  @State currentIndex: number = CommonConstants.HOME_TAB_INDEX;
  private tabsController: TabsController = new TabsController()

  @Builder TabBuilder(title: Resource, index: number, selectedImg: Resource, normalImg: Resource) {
    Column() {
      Image(this.currentIndex === index ? selectedImg : normalImg)
        .renderMode(this.currentIndex === index ? ImageRenderMode.Original : ImageRenderMode.Template)
        .width($r('app.float.mainPage_baseTab_size'))
        .height($r('app.float.mainPage_baseTab_size'))
      Text(title)
        .margin({ top: $r('app.float.mainPage_baseTab_top') })
        .fontSize($r('app.float.main_tab_fontSize'))
        .fontColor(this.currentIndex === index ? $r('app.color.mainPage_selected') : $r('app.color.mainPage_normal'))
    }
    .justifyContent(FlexAlign.Center)
    .height($r('app.float.mainPage_barHeight'))
    .width(CommonConstants.FULL_PARENT)
    .onClick(() => {
      this.currentIndex = index;
      this.tabsController.changeIndex(this.currentIndex);
    })
  }

  build() {

    Tabs({
      barPosition: BarPosition.End,
    }) {
      TabContent()
        .tabBar(this.TabBuilder($r('app.string.tab_bar_discover'), 0, $r('app.media.t_actionbar_discover_normal'), $r('app.media.t_actionbar_discover_normal')))
      TabContent()
        .tabBar(this.TabBuilder($r('app.string.tab_bar_music_people'), 1, $r('app.media.icon'), $r('app.media.icon')))
      TabContent()
        .tabBar(this.TabBuilder($r('app.string.tab_bar_my'), 2, $r('app.media.t_actionbar_music_normal'), $r('app.media.t_actionbar_music_normal')))
      TabContent()
        .tabBar(this.TabBuilder($r('app.string.tab_bar_follow'), 3, $r('app.media.icon'), $r('app.media.icon')))
      TabContent()
        .tabBar(this.TabBuilder($r('app.string.tab_bar_communities'), 4, $r('app.media.icon'), $r('app.media.icon')))
    }.width('100%')
    .backgroundColor(Color.White)
    .barHeight('56vp')
    .barMode(BarMode.Fixed)
  }
}