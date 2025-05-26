import { Component } from '@angular/core';
import {HeaderComponent} from "../../common/header/header.component";

@Component({
  selector: 'app-login-page',
  standalone: true,
  imports: [
    HeaderComponent
  ],
  templateUrl: './login-page.component.html',
  styleUrl: './login-page.component.css'
})
export class LoginPageComponent {

}
