#include <stdio.h>
#include <stdlib.h>

typedef struct Nodes{
    char *data;
    struct Nodes *next;
}Node;

Node * initList(int size){
    Node * head;
    head = (Node *)malloc(sizeof(Node));
    fgets
    char *data;
    for(int i = 0; i < size; i++){

    }
}

void printList(Node * linkedList){
    while(linkedList->next != NULL){
        printf("%s\n",linkedList->data);
        linkedList = linkedList->next;
    }
}
