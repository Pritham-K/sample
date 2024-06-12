#include<iostream>
#include<bits/stdc++.h>
using namespace std;
#define LEN 100

float en[LEN][1]={0},de[LEN][1]={0},msg[LEN][1],keyM[2][2];
int l;
void getkey()
{
    int i,j,k=0;
    char key[4],mes[LEN];
    cout<<"enter key: "<<endl;
    cin>>key;
    for(i=0;i<2;i++){
        for(j=0;j<2;j++){
            keyM[i][j]=int(toupper(key[k]))%65;
            k++;
        } 
    }
    cout<<"enter string"<<endl;
    cin>>mes;
    l=strlen(mes);
    for(i=0;i<l;i++)
    	msg[i][0]=toupper(mes[i])%65;
}

void enc()
{
    int i,j,k;
    for(i=0;i<l;i+=2){
    	for(k=0;k<2;k++){
    		en[i][0]+=keyM[i%2][k]*msg[i+k][0];
   			en[i+1][0]+=keyM[(i+1)%2][k]*msg[i+k][0];
		}
	}
    cout<<"Encrypted text: "<<endl;
    for(k=0;k<i;k++)
    	cout<<(char)((int(en[k][0])%26)+97);
}

void dec()
{
    int i,j,k;
    float det=keyM[0][0]*keyM[1][1]-keyM[0][1]*keyM[1][0];
    if(det<0){
    	det=(-1)*det;
	}

    float inv[2][2];
    inv[0][0]=keyM[1][1]/det;
    inv[1][1]=keyM[0][0]/det;
    inv[0][1]=-keyM[0][1]/det;
    inv[1][0]=-keyM[1][0]/det;
    for(i=0;i<l;i+=2)
    {
        for(k=0;k<2;k++){
            de[i][0]+=inv[i%2][k]*en[i+k][0];
            de[i+1][0]+=inv[(i+1)%2][k]*en[i+k][0];
        }
    }
    cout<<endl;
    cout<<"decrypt"<<endl;
    for(k=0;k<i;k++)
    	cout<<(char)(((int)de[k][0]%26)+97);
    
}
int main() {
    getkey();
    enc();
    dec();
    return 0;
}
