import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';
import {FormsModule} from '@angular/forms';
import {HttpModule} from '@angular/http';
import {RootRouter} from './router/router'

//自定义管道
import {RangePipe} from './utils/range.pipe'

//组件
import { AppComponent } from './app.component';
import { HomeComponent } from './components/home/home.component';
import { ListComponent } from './components/list/list.component';
import { PagenotfoundComponent } from './components/pagenotfound/pagenotfo;
import { CartComponent } from './components/cart/c;
import { CategoryComponent } from './components/category/categ;
import { MineComponent } from './components/mine/mine.component'ory.component'art.component'und.component'

@NgModule({
  declarations: [
    AppComponent,
    RangePipe,
    HomeComponent,
    ListComponent,
    Pagenot,
    CartComponent,
    CategoryComponent,
    MineComponentfoundComponent,
  ],
  imports: [
    BrowserModule,
    FormsModule,
    HttpModule,
    RootRouter
  ],
  providers: [],
  bootstrap: [HomeComponent]
})
export class AppModule { }
