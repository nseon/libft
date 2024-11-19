/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_calloc.c                                        :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: nseon <nseon@student.42lyon.fr>            +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2024/11/12 17:38:43 by nseon             #+#    #+#             */
/*   Updated: 2024/11/14 14:43:35 by nseon            ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "libft.h"

void	*ft_calloc(size_t nmemb, size_t size)
{
	unsigned char	*tab;
	size_t			i;

	i = 0;
	if (size * nmemb > INT_MAX)
		return (0);
	tab = malloc(nmemb * size);
	if (tab == NULL)
		return (0);
	ft_bzero(tab, nmemb * size);
	return ((void *)tab);
}
