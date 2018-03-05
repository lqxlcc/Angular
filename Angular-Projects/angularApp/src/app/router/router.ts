import {RouterModule,Routes} from '@angular/router';

//龙飞宇
import {ListComponent} from '../components/list/list.component';
import {PagenotfoundComponent} from "../components/pagenotfound/pagenotfound.component";

import { HomeComponent } from '../components/home/home.component';

const appRoutes: Routes = [
    {path:'',component:HomeComponent},
    {path:'list',component: ListComponent},
    {path:'home',component:HomeComponent},
    {path:'**',component:PagenotfoundComponent}
   
]

export const RootRouter = RouterModule.forRoot(
    appRoutes,
    {enableTracing:false}
)