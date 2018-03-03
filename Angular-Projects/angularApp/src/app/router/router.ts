import {RouterModule,Routes} from '@angular/router';

//龙飞宇
import {ListComponent} from '../components/list/list.component';
import {PagenotfoundComponent} from "../components/pagenotfound/pagenotfound.component";

const appRoutes: Routes = [
    {path:'list',component: ListComponent},
    {path:'**',component:PagenotfoundComponent},
   
]

export const RootRouter = RouterModule.forRoot(
    appRoutes,
    {enableTracing:false}
)